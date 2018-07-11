package com.epam.epmrduaqgv.back.dto;

import lombok.*;
import org.springframework.data.domain.Page;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
@ToString
@Getter
@Setter
public class PageDTO<T> {

    private List<T> data;
    private int pageNumber;
    private int pageSize;
    private int numberOfElements;
    private long totalElements;

    @SuppressWarnings("unchecked")
    public static <T> PageDTO<T> of(Page<T> page) {
        return (PageDTO<T>) PageDTO.builder()
                .data((List<Object>) page.getContent())
                .pageNumber(page.getNumber())
                .pageSize(page.getSize())
                .numberOfElements(page.getNumberOfElements())
                .totalElements(page.getTotalElements())
                .build();
    }
}
