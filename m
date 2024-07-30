Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F0B19EEBD
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350874; cv=none; b=h5lPiwfas7e+ngNVEsSTcjZwNV5FuMENiSuDics+qmjH77dK0c/6PjXhJex8Xcdvcqq0x10fAj97teLJhEGn6QqTMruoszX+VO3MrhFAyRGx3nBUlxQbqSf8hFuR6/00U0hWRF4N1SQOJYwllLDXFk+bO0WCHyFc+ngmfxmqNPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350874; c=relaxed/simple;
	bh=cTI+YjBitz74R3nmR72IlRqLtVxl6R9IAY+bHLuOOrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bv27RPXrkJrXWxsnMPz/+qy0Zlb3fot9CLa0byBp8SVb/5tVhIJ6CYknVzJIto/C9GJJ4Caq7CImkHHykO/lTmJXRHVk82t1IpRyqAXVJ++r7WLNsy5h+K5pQHRfrZ/DpaSWPk7X6KCFOGoWG2MoZ9RdiSDFDX6gpBczFFjzD/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=au89eZR6; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="au89eZR6"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7093d565310so3696505a34.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722350872; x=1722955672; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KrPUSNeFtUoQE47sRLQsqvHeQ5MzWDhr7teSoQBbv/o=;
        b=au89eZR6AmhCaMz4FQTrp2y8vYZ7TPP3mLlh7j6gVoIFOVgbBU+H78wXcDAdc15p/Y
         frISQQ4A2LSLZbhuRzudQfNMh0cTGWgiLnYintRcelfMwKXRvvvnGyKGpjGiwWhrNcC1
         wysLPetbgnZcleERTiDDKdmIMY/yQ8PeCYid7/05SxQoJx193x5BWOEc2vM2ac1cqqUW
         mV+XbzuFrbvdS+FjSwFDn6ApcI/8NfsEEH/iOzq5QywroR9clPcnUb1uVX0FsSqvGSgY
         ixfFan/FNl0isd3yHfr/OtzZ+8t5LQg1fCJjMlFzgFPc12z667zgZhkvkRxXstcaZDrW
         XiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722350872; x=1722955672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrPUSNeFtUoQE47sRLQsqvHeQ5MzWDhr7teSoQBbv/o=;
        b=Tv9M0gS2JNGgLWQi+6szHJKC/UWlqgghPmd6Mz43DbpwC4o0vA+6RZzHCP+TPCzEbL
         vUxo2ik3GHnYxpGmBJqbgbG8uFQvs/4olmmHats50GJFT5itRIUG09BUneVegIqT79oJ
         qg4YVfUQaYe8sgszsXx6dMlmqgo+kmteobFAT+U95BPX1apSxef0HPxMP/+4JgN1Rw0E
         73D6i517DhJrxlUzK71Wyjv19YOsVe57YcUwA12kNLa/WkCDM6v5KEORXdoe4AnITS4T
         B5VH/xw2xzpGAZ5fqVR39avQ4gT/W8iTComKbiDk+bDZbLdggoPitkMt+JYrCdveYvOR
         enoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfo8CGi2PEPT7hGY2tL3PM/WRIPF5oIX0cfoApRSjSAmlIcJtm461712i8vmloB07z81YxNGwtA8PVN4wClhfUXHlmErvt0f39A3Q3PQ==
X-Gm-Message-State: AOJu0YyNQuNqU8ehjHnPx6aflh6PcW9t9PrfKDqL77Lw0ZRKsoPccEY9
	Qxp1+RVW+MhHKo0hMj3UQ806mkAE9PtmySipYmyyuFO5covHrVStBOXTJ1FjzyQ=
X-Google-Smtp-Source: AGHT+IGIo7EZ1NVtJyYeWy7OjNQHB6/jdcUWY8JQ73VVrZG1sHvv/LZIidEEuXYsZbvfuhtDSsM+Bg==
X-Received: by 2002:a05:6830:309c:b0:709:2fa3:133a with SMTP id 46e09a7af769-70940c1ae83mr9532547a34.18.1722350871901;
        Tue, 30 Jul 2024 07:47:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7095aea6512sm403459a34.62.2024.07.30.07.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 07:47:51 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:47:50 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
Subject: Re: [PATCH] staging: media: atomisp: remove trailing statement
Message-ID: <2ca1633e-aee9-42cf-a807-7f397ff31b4a@suswa.mountain>
References: <20240730071808.35591-1-sskartheekadivi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730071808.35591-1-sskartheekadivi@gmail.com>

On Tue, Jul 30, 2024 at 07:18:08AM +0000, Sai Sree Kartheek Adivi wrote:
> this patch fixes the following checkpatch.pl error..
> ERROR: trailing statements should be on next line
> #48: FILE: drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c:48:
> +	if (!anr) return;
> 
> Signed-off-by: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
> ---
> Just started contributing to the kernel. please help me understand my
> mistakes if any.
> 

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

