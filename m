Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDD2D9497
	for <linux-staging@lists.linux.dev>; Tue,  7 Oct 2025 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759842360; cv=none; b=jpHar9Wa7Qo9l2Y4YTi8ZwEhrYzAhQDGxGN9kLc4L02v2QUhFxq3hz4C25VUiU5a/mO186EZz8AF+S+Y/H2+INHbG39q1EnbjDuLYEDO/jNOMNhYkJwsKYuMxTaDmoXSGfo9GrAgwc8Sev/qNHQjGHpyzN3QzjCg51ByLEobtG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759842360; c=relaxed/simple;
	bh=hLbvYiGrn95hNdclry4paH2tViQndDMSYDGnCLxfDdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D41/XdlZ6Kwn6R3tf6JJhbWrGoDxOl2prRw9bGa4NurikrlBoK93KVL4MaNz6WbaVjCMUyV7yyNNypvl7FFyDs0ZcphTRfpPoofbb3MTOw+NMIAqKOg3wPOUbZqf36oZWZbKWN/GmlAEnzR/GYQZvt80oEXMB85PD6zHMQmX8zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HvwSJ2Hx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HvwSJ2Hx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e504975dbso37976805e9.1
        for <linux-staging@lists.linux.dev>; Tue, 07 Oct 2025 06:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759842357; x=1760447157; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZoEfMjGCa0h/Uane5YdUsRF/AtaM6l7u/C9eK3tKi0=;
        b=HvwSJ2HxvatYfXZed4d5koDPxvAQF9CFn8zRA/PKYX5i9adhfwctBcuFgVPnU9Onis
         v7Uh5ObrApwXn0tFkAA3JkGnmvBqQPzykwQVjGaLtV8lPNs5hRZFeuiY77/EhuMBNA06
         pvVhCkFBcNsB5frdzEhz7OJFlNmb8o6Y6wBJl3ri5zNlL8ULaH9lx2qoNJ5I47aB2K1n
         /4B2+6Tllrj3PDDR2l0kntPbYUIpsfzzvUka7v8L8creiQSKNWtpVKOlvYGVZtC6f4QX
         gWET6OeaADqt16PlCLBLArFVXOWjU6O04YhXu0mcbhpS3X2eIccXXu56zLcj5kfVrOr0
         Bn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842357; x=1760447157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZoEfMjGCa0h/Uane5YdUsRF/AtaM6l7u/C9eK3tKi0=;
        b=xRB8CEtZgKWwjbkEjNv2/n3SOaHeS3WOXmxX+s6uYBtMvfPHidveT6bhXjSOAgKU5O
         0L3X01fhyt6AAmySpYdeGGl9QP5XMH7a5T9gMKDqbagiPGkiOS+CUmxgEJSblXEVAvjS
         nQ/AGu3gtGhbZm1A9wgRJbvMXAzf+YRcjL0I944Lm95vk8NRSnG9PM6kitMdrUOmLUjZ
         xYkT2TUwQ34lEkQXmsgv0Hv8tPOGVBmmk+0gd1t1AtpBR+sqVcGMapaJbOVp/hxEdW6p
         o9D5SnCdfclZJkhdujUuoNGV7hTUhSRbweuQm8SOm95LR67Mhht7vGsc6RRvpbhsCiCv
         sPnw==
X-Forwarded-Encrypted: i=1; AJvYcCVEl9U+PImZi9SF508ZC7AuTKOuiQNVM9fwVTOKwiZCiDShllWAa9d+j45C0QSdXwsxzEo0F7+i3yo/X8RL@lists.linux.dev
X-Gm-Message-State: AOJu0YzocacSKgKhlRbPEyrfrp/NiXSXjjXSG2kkHvHyqtb7oFrcOH5E
	s0wUKVt6cKcmGGhwxJjGN06f23CM5ZQ6STyD5Fo1hVbwz5ImXLeTas9A4nAbPRUSls8=
X-Gm-Gg: ASbGnctbxAM7+XOTJZnvCWKFx6xjeASUF7MKV777tr2RJWhF6UHrQY2Bf2zycgHJFgO
	+iEfAPC3p2IFmF57NtiEGylAEzJQX1wkl6u9lhWUtamvjEqdpnLdfc103Jp8ygq6F5QiA7y1l9I
	2hDeNYz36y5GzTFVi0jkB/nCjeHWzSNGejbbFmUS9t32Fvwv+3ioh91vu54zIbwLm4Irp843yW6
	JpYX2sLfzV2D7xLAQrVEi4rnMiQfsZEnQwKJp55Of8Sk+joUVC0GywZJC5o2YcH4Wc991IbV/Fg
	d4ZRPOmrpJtCao890wr6fhBguVTX39lP+e9RijA2fg4xKzE97ehtOpJWODVMWXshs0q3aE+rUW3
	gltBXK3R00VUIwA9UYgWt7TH5qdUiyc0R7sLlwRPYvY8T8sXZMkxWp90d
X-Google-Smtp-Source: AGHT+IFRlbAen4/r+XsyINyk3KQxN0S++HomOpc//Y3MDi1jdyUcyo8Q/HfG/nXi94cmHvaMwK+0AA==
X-Received: by 2002:a05:600c:8b45:b0:46e:3dc2:ebac with SMTP id 5b1f17b1804b1-46e71168aa1mr111024305e9.27.1759842357150;
        Tue, 07 Oct 2025 06:05:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fa57d8f9bsm12241975e9.1.2025.10.07.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:05:56 -0700 (PDT)
Date: Tue, 7 Oct 2025 16:05:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Murad Sadigov <sdgvmrd@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: fix integer overflow in write()
Message-ID: <aOUQMZQr3JwNTUYX@stanley.mountain>
References: <CAEuvNs2b-_Q=dazKjhUwJoZ5XUpjRsf-FrCOTR_j24T+EG-f=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEuvNs2b-_Q=dazKjhUwJoZ5XUpjRsf-FrCOTR_j24T+EG-f=g@mail.gmail.com>

Hi Murad,

This can't happen because vfs_write() caps len at <= MAX_RW_COUNT.

Presumably this is your Linkedin page?
https://www.linkedin.com/in/mrdsdgv/?originalSubdomain=az

When you're doing the analysis on this sort of thing, it's nice to
have the Smatch cross function db built.  I hacked up the vfs_write()
information a bit so it says that len can't be more than 1G when
actually it's capped at 2G.  I did that so that count + len wouldn't
trigger an integer overflow warning.  Those are prevented in
rw_verify_area().

$ smdb axis_fifo_write
file | caller | function | type | parameter | key | value |
     fs/read_write.c |            vfs_write | (struct file_operations)->write |           INTERNAL | -1 |                 | long(*)(struct file*, char*, ulong, llong*)
     fs/read_write.c |            vfs_write | (struct file_operations)->write |           BIT_INFO |  0 |       f->f_mode | 0x40002,0xffffffff
     fs/read_write.c |            vfs_write | (struct file_operations)->write |          USER_DATA |  1 |             buf | 0-u64max[c]
     fs/read_write.c |            vfs_write | (struct file_operations)->write |          USER_DATA |  2 |             len | 0-1000000000
     fs/read_write.c |            vfs_write | (struct file_operations)->write |          USER_DATA |  3 |            *off | 0-1000000000
     fs/read_write.c |            vfs_write | (struct file_operations)->write |           USER_PTR |  3 |             off | 
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        PARAM_VALUE |  0 |               f | 4096-9223372036854775807
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        PARAM_VALUE |  0 |         f->f_op | 4096-ptr_max
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        PARAM_VALUE |  0 |  f->f_op->write | 1-u64max
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        PARAM_VALUE |  2 |             len | 0-1000000000,2147479552
     fs/read_write.c |            vfs_write | (struct file_operations)->write |          FUZZY_MAX |  2 |             len | 2147479552
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        PARAM_VALUE |  3 |            *off | 0-1000000000
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        PARAM_VALUE |  3 |             off | 0,4096-ptr_max
     fs/read_write.c |            vfs_write | (struct file_operations)->write |          CONTAINER |  0 |        -32-80+0 | $(-1)
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        DATA_SOURCE |  0 |               f | $0
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        DATA_SOURCE |  1 |             buf | $1
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        DATA_SOURCE |  2 |             len | $2 [m]
     fs/read_write.c |            vfs_write | (struct file_operations)->write |        DATA_SOURCE |  3 |             off | $3
     fs/read_write.c |            vfs_write | (struct file_operations)->write |               2059 | -1 |                 | y
     fs/read_write.c |            vfs_write | (struct file_operations)->write |               2059 | -1 |                 | y
     fs/read_write.c |            vfs_write | (struct file_operations)->write |           BUF_SIZE |  3 |             off | (-1),8
$

regards,
dan carpenter

