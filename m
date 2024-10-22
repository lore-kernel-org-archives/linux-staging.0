Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A019DFB5
	for <linux-staging@lists.linux.dev>; Tue, 22 Oct 2024 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607130; cv=none; b=gG7p2GtzZ2yWwpYZjPmUDUnc/rWKnOd4oAtVIynyv/ZDjOAoqhDwolat0Ykxkf/OWjM2c3aOHW55fS6G8Nbi8fDV+0NlNRNOzO7z96V5dL3yxdPf8dYLZJZ6GTOgq/VVXYG3ZDekIoW6Cu+Uag9F6HCV1lXfzza1WQ0x+ofg2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607130; c=relaxed/simple;
	bh=37Iqmo+qy+WFGzsf6uya3SA3tdIscHLZylxDIyGXIns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C74Gr7o3kqeckXEy5afhlgqZJJT+qVNymz6tNvqxmx4lejXTEVx7qvE5+9Xy44zAbxVsztdVA3DFFk+uOTZkX4swOaPTMQwDg5qEjSMDWhScpcLsDLTk7MD8w0YmJ/BeIVSvvaeE3WeccX6PPWTsIUIQIiV75pQMurSRrQwRMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ajg6+3Bi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ajg6+3Bi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4314a26002bso63074675e9.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Oct 2024 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729607127; x=1730211927; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wehu+MEAsSEQ19L7grgHaXBLH+E5c19oiwcAV7y0Jvs=;
        b=Ajg6+3Bin+DwFOIWyYUsrf5zXMNsaJVLLjjpjC8JBBaZQM0w1wJXCC5vyd8t7A1GEv
         fc6C3XsUyMtOxEJZIqxOmQlZpaYG9BranZGuvMTzUtdLa7rlO9uie62+8b0KVbaf31Ge
         D8KT82WyiW/gZ98yJmIS+7n1sOjpMC0BhK5Rj9BzouDnsy0Th+HEY/Rv+mA9RBE9eXxb
         e2En27F29J/9VwEKWQp+Jw0b1I5L93l0cUf2jNEtLbxxjGqMjE8tYdCL+C/7SXye3acM
         JHGzlsmGmzLQPRsTe2joAjbaPsxnaNnRShw8lheN8WX7y8n1aukiSNkwt4GWd2R2AnAD
         cujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729607127; x=1730211927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wehu+MEAsSEQ19L7grgHaXBLH+E5c19oiwcAV7y0Jvs=;
        b=UxijebaiOTTm8e5CHFYBqQk+uqSPOAyx3dLNf9DwypCV4ItKDQGV7DZ3eY9R5oQ/98
         QGAbeVdyPhOZC+aQFV2vW1mjZ4WWd37rUr5MsRN76rQXvUZ5eLhuxSI62eYBs/HALhsd
         i8K3bcabxVtUE0nhp0Lf+ARzu+UdXqTvF3e8Fkl+inXWoet0XHWmBOCCsVB5It8bhWR4
         8MgR2dS2QXFcWESpKYQroKrM9JvEyMbidm2eqLGAPVzxayvj9wxLyD0h0B4ibh+m9dvb
         gxTCeqlWcxeHQxXM08isf+ksHCuhGokycmr2z0k86lBiB/NLrE8mRutBwb9UCs37hfRu
         bS9w==
X-Forwarded-Encrypted: i=1; AJvYcCVtEQORf5V8zTBSjcVTB1fi7DA4dbg7ctSFQ7gbmLVKBDAHhALax52yKxfG3udA8eQ+FgZDVwtgevP+PeTr@lists.linux.dev
X-Gm-Message-State: AOJu0YwJvNzQHgqpuDH8CdHfsfUXl/n5FZOdNvgXQx3EDR1qkay4f5GH
	6QfyR/TrzD9t2wWQAoibjTvXNwc5VHRlFNHt9rHA45oqdSdWCRjYU2/zvm3iJYQHGYCajkwhcQN
	CBSA=
X-Google-Smtp-Source: AGHT+IG2iYYYcddme4KeFQF/W/N4hRK2Bm7CBf1vGlQL3CKnzTF08HVGCHmo4z335CAe2+S+n9JU6Q==
X-Received: by 2002:a05:600c:1c8d:b0:431:12a8:7f1a with SMTP id 5b1f17b1804b1-4316165d3acmr142075275e9.16.1729607126945;
        Tue, 22 Oct 2024 07:25:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58c125sm89054125e9.26.2024.10.22.07.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 07:25:25 -0700 (PDT)
Date: Tue, 22 Oct 2024 17:25:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zicheng Qu <quzicheng@huawei.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	tanghui20@huawei.com, zhangqiao22@huawei.com,
	judy.chenhui@huawei.com
Subject: Re: [PATCH] drivers/staging/iio/frequency/ad9832.c: fix division by
 zero in ad9832_calc_freqreg()
Message-ID: <6c896172-d372-442a-a61e-6b3e46b9cbb0@stanley.mountain>
References: <20241022134354.574614-1-quzicheng@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022134354.574614-1-quzicheng@huawei.com>

It would be better if the subject prefix were "staging: iio: ad9832:"

[PATCH] staging: iio: ad9832: fix division by zero in ad9832_calc_freqreg()

On Tue, Oct 22, 2024 at 01:43:54PM +0000, Zicheng Qu wrote:
> In the ad9832_write_frequency() function, clk_get_rate() might return 0.
> This can lead to a division by zero when calling ad9832_calc_freqreg().
> The check if (fout > (clk_get_rate(st->mclk) / 2)) does not protect
> against the case when fout is 0. The ad9832_write_frequency() function
> is called from ad9832_write(), and fout is derived from a text buffer,
> which can contain any value.
> 
> Link: https://lore.kernel.org/all/2024100904-CVE-2024-47663-9bdc@gregkh/
> Fixes: ea707584bac1 ("Staging: IIO: DDS: AD9832 / AD9835 driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zicheng Qu <quzicheng@huawei.com>

Otherwise it looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

