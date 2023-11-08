Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E1BCA78
	for <linux-staging@lists.linux.dev>; Wed,  8 Nov 2023 06:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mByJEiaI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6c311ca94b4so5568951b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Nov 2023 22:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699424607; x=1700029407; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9PXT7WtNc9war0QIYrSKiH8o0H7yV2HB6Vr4SCPxz8=;
        b=mByJEiaI3FroZu9Pa/6l7zVczYcgNd0VoCfjdOcLiL88FlxheUuTO05W0RiXiaYiuk
         hXmjlpJICo8UzJTG5NO6nWHFjXfz30CyO41Rxr11RzVpQMNERCYgmECe6FVc9bs5jnWh
         ZW3MZd6njI/zv+a8P+bULum6nwPU7TXkdkQEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699424607; x=1700029407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9PXT7WtNc9war0QIYrSKiH8o0H7yV2HB6Vr4SCPxz8=;
        b=bjseMNcLTdypqn02uYjqhdR0iT+VYq0BbitWe4huWhnOBzgzHVpor4wN7m2IMzxqIJ
         LrB+lukjMoIALiJbJSsS01+d3fxZMHKgg+TCyCQnDlA97Bm4ClEY2vZp/UxdsSJzoEw+
         z07G5hb4jy4qQJylMeOGyI4eAczSIAu+J11+P5MWIYXbOePmn6WpinIUTkm7gTHBxV2l
         H8Ka2qm74Dwt1frD0WmY8VGnjybFVghC4DVbn42qpDNivQFq5Nme8SkhMM1fbzTIZ1D4
         uVHMpMNmZSF2Imh1JXn3D21ffVz2yn7Hr8Dww8fXvqL9S/eig0Z9+RpYC7JWTEksLT/F
         F00A==
X-Gm-Message-State: AOJu0YwB2HxqceCdA9E8E9g690hjxbPf0nsuN8IAIUNBM7Nt1KSDgmM3
	a4EbrKivNDQDpViSB3XtS7+4hA==
X-Google-Smtp-Source: AGHT+IEE1CcP9XDcoi36X9nEdzrJoWVV/Ohs+mfJ3KeghFslU25c0yPM0dXQu3eD4ho1jOb9TiTM7Q==
X-Received: by 2002:a05:6a21:7185:b0:181:1cfa:4106 with SMTP id wq5-20020a056a21718500b001811cfa4106mr1507162pzb.62.1699424606696;
        Tue, 07 Nov 2023 22:23:26 -0800 (PST)
Received: from chromium.org (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902b61500b001c9c97beb9csm879787pls.71.2023.11.07.22.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 22:23:26 -0800 (PST)
Date: Wed, 8 Nov 2023 06:23:22 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: Re: [PATCH v14 02/56] media: videobuf2: Rework offset 'cookie'
 encoding pattern
Message-ID: <20231108062322.l2k2n2jlpoaa4tws@chromium.org>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-3-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031163104.112469-3-benjamin.gaignard@collabora.com>

Hi Benjamin,

On Tue, Oct 31, 2023 at 05:30:10PM +0100, Benjamin Gaignard wrote:
> Change how offset 'cookie' field value is computed to make possible
> to use more buffers.
> The maximum number of buffers depends of PAGE_SHIFT value and can
> go up to 0x7fff when PAGE_SHIFT = 12.
> With this encoding pattern we know the maximum number that a queue
> could store so we can check it at  queue init time.
> It also make easier and faster to find buffer and plane from using
> the offset field.
> Change __find_plane_by_offset() prototype to return the video buffer
> itself rather than it index.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../media/common/videobuf2/videobuf2-core.c   | 73 +++++++++----------
>  1 file changed, 35 insertions(+), 38 deletions(-)
> 

Thanks a lot for working on this series. Just one comment inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index a5e57affeb30..09be8e026044 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -31,6 +31,11 @@
>  
>  #include <trace/events/vb2.h>
>  
> +#define PLANE_INDEX_SHIFT	(PAGE_SHIFT + 3)
> +#define PLANE_INDEX_MASK	0x7

Could we somehow ensure that it indeed matches VIDEO_MAX_PLANES?

One thing that comes to my mind would be

#define PLANE_INDEX_BITS	3
#define PLANE_INDEX_SHIFT	(PAGE_SHIFT + PLANE_INDEX_BITS)
#define PLANE_INDEX_MASK	BIT_MASK(PLANE_INDEX_BITS)

BUILD_BUG_ON(BIT(PLANE_INDEX_BITS) != VIDEO_MAX_PLANES);

Alternatively we could change the videodev2.h, so that we have

#define VIDEO_MAX_PLANES_BITS	3
#define VIDEO_MAX_PLANES	(1U < VIDEO_MAX_PLANES_BITS)

and then we can just VIDEO_MAX_PLANES_BITS in our definitions in this file
and no checks would be necessary.

Best regards,
Tomasz

> +#define MAX_BUFFER_INDEX	BIT_MASK(30 - PLANE_INDEX_SHIFT)
> +#define BUFFER_INDEX_MASK	(MAX_BUFFER_INDEX - 1)
> +
>  static int debug;
>  module_param(debug, int, 0644);
>  
> @@ -358,21 +363,27 @@ static void __setup_offsets(struct vb2_buffer *vb)
>  	unsigned int plane;
>  	unsigned long offset = 0;
>  
> -	if (vb->index) {
> -		struct vb2_buffer *prev = q->bufs[vb->index - 1];
> -		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
> -
> -		offset = PAGE_ALIGN(p->m.offset + p->length);
> -	}
> +	/*
> +	 * The offset "cookie" value has the following constraints:
> +	 * - a buffer can have up to 8 planes.
> +	 * - v4l2 mem2mem uses bit 30 to distinguish between
> +	 *   OUTPUT (aka "source", bit 30 is 0) and
> +	 *   CAPTURE (aka "destination", bit 30 is 1) buffers.
> +	 * - must be page aligned
> +	 * That led to this bit mapping when PAGE_SHIFT = 12:
> +	 * |30                |29        15|14       12|11 0|
> +	 * |DST_QUEUE_OFF_BASE|buffer index|plane index| 0  |
> +	 * where there are 15 bits to store the buffer index.
> +	 * Depending on PAGE_SHIFT value we can have fewer bits
> +	 * to store the buffer index.
> +	 */
> +	offset = vb->index << PLANE_INDEX_SHIFT;
>  
>  	for (plane = 0; plane < vb->num_planes; ++plane) {
> -		vb->planes[plane].m.offset = offset;
> +		vb->planes[plane].m.offset = offset + (plane << PAGE_SHIFT);
>  
>  		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
>  				vb->index, plane, offset);
> -
> -		offset += vb->planes[plane].length;
> -		offset = PAGE_ALIGN(offset);
>  	}
>  }
>  
> @@ -2188,10 +2199,9 @@ EXPORT_SYMBOL_GPL(vb2_core_streamoff);
>   * __find_plane_by_offset() - find plane associated with the given offset
>   */
>  static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
> -			unsigned int *_buffer, unsigned int *_plane)
> +			struct vb2_buffer **vb, unsigned int *plane)
>  {
> -	struct vb2_buffer *vb;
> -	unsigned int buffer, plane;
> +	unsigned int buffer;
>  
>  	/*
>  	 * Sanity checks to ensure the lock is held, MEMORY_MMAP is
> @@ -2209,24 +2219,15 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
>  		return -EBUSY;
>  	}
>  
> -	/*
> -	 * Go over all buffers and their planes, comparing the given offset
> -	 * with an offset assigned to each plane. If a match is found,
> -	 * return its buffer and plane numbers.
> -	 */
> -	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
> -		vb = q->bufs[buffer];
> +	/* Get buffer and plane from the offset */
> +	buffer = (offset >> PLANE_INDEX_SHIFT) & BUFFER_INDEX_MASK;
> +	*plane = (offset >> PAGE_SHIFT) & PLANE_INDEX_MASK;
>  
> -		for (plane = 0; plane < vb->num_planes; ++plane) {
> -			if (vb->planes[plane].m.offset == offset) {
> -				*_buffer = buffer;
> -				*_plane = plane;
> -				return 0;
> -			}
> -		}
> -	}
> +	if (buffer >= q->num_buffers || *plane >= q->bufs[buffer]->num_planes)
> +		return -EINVAL;
>  
> -	return -EINVAL;
> +	*vb = q->bufs[buffer];
> +	return 0;
>  }
>  
>  int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
> @@ -2306,7 +2307,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  {
>  	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
>  	struct vb2_buffer *vb;
> -	unsigned int buffer = 0, plane = 0;
> +	unsigned int plane = 0;
>  	int ret;
>  	unsigned long length;
>  
> @@ -2335,12 +2336,10 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	 * Find the plane corresponding to the offset passed by userspace. This
>  	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
>  	 */
> -	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
> +	ret = __find_plane_by_offset(q, offset, &vb, &plane);
>  	if (ret)
>  		goto unlock;
>  
> -	vb = q->bufs[buffer];
> -
>  	/*
>  	 * MMAP requires page_aligned buffers.
>  	 * The buffer length was page_aligned at __vb2_buf_mem_alloc(),
> @@ -2368,7 +2367,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
>  	if (ret)
>  		return ret;
>  
> -	dprintk(q, 3, "buffer %d, plane %d successfully mapped\n", buffer, plane);
> +	dprintk(q, 3, "buffer %u, plane %d successfully mapped\n", vb->index, plane);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(vb2_mmap);
> @@ -2382,7 +2381,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
>  {
>  	unsigned long offset = pgoff << PAGE_SHIFT;
>  	struct vb2_buffer *vb;
> -	unsigned int buffer, plane;
> +	unsigned int plane;
>  	void *vaddr;
>  	int ret;
>  
> @@ -2392,12 +2391,10 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
>  	 * Find the plane corresponding to the offset passed by userspace. This
>  	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
>  	 */
> -	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
> +	ret = __find_plane_by_offset(q, offset, &vb, &plane);
>  	if (ret)
>  		goto unlock;
>  
> -	vb = q->bufs[buffer];
> -
>  	vaddr = vb2_plane_vaddr(vb, plane);
>  	mutex_unlock(&q->mmap_lock);
>  	return vaddr ? (unsigned long)vaddr : -EINVAL;
> -- 
> 2.39.2
> 
