Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BA11A0AFF
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 13:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724763996; cv=none; b=YF6vxZiEgB+svq2s/8/Kzgg1EShoLr3cBKDzX9Qw+8Zl4sWFnGtpF66X29Ba36KgjjcpWcIHGS+LjtpYTh1vIlEPvCr2wH07Gvsn7MB0cPOmVrlEmdlB7OyFFbBSibHMM+3Bcb4YYK6uXbYx29EZj5E66pwoXhQOsOxDn882hAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724763996; c=relaxed/simple;
	bh=I7QpzNgTozn0ypQN6lXdDMUyE5Ztc8z6lkFo/pacgsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeDz8ca6mlECEdNSDk+uQ6ukVoZ7T/M+QlvIUxNYaRH+WB72wIY9CVxRzDIsHRUEgapEdBE7rzjCG+fXEZqUk5SEQrDO+7Rbto6Jokq8H2cZsW/JjKIDl3ng8whUL4SwXYuwmaSE6GsiTjwE4eUfuwQYy4CjCsU2hGF///3KMrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t15ZfGSc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t15ZfGSc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a86e5e9ff05so103747066b.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 06:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724763993; x=1725368793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8nfq6eg/qBHA2qLWGmU88ECXRm0YOI1tfynwWiVtLqw=;
        b=t15ZfGScQxFZRLyyPebgNi+LJB8eUO+A5+Fh/3GmwxXRnuZILqpt6QA1TNUJkP5NSi
         JHAV8+XFameviA+Foe5/b4H+hRjT5p9VHhkvAUDmpJ40X379IM2GPAICQNjRDXK8YzLv
         zKoqp/eyvcwZl6uTZ9erTJUL6WfzGbSzxS5LAJ9rzuWLD2ab5Fp1cBaY0j2IdBOhIXNt
         GSEDCAP8paIZJ4r26No0xkQxBaIhLom7X2IFvOa1VLvPzms7r0UYOufkcPBf0TqkNrsK
         btDxFJ3D/evlyB0TRCTevREJkiIKH0cu4Lxcak4yz9oOO0thtzV61b+TIyiHY9l1nlnk
         GI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763993; x=1725368793;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nfq6eg/qBHA2qLWGmU88ECXRm0YOI1tfynwWiVtLqw=;
        b=WdIVOjdV7Ey2XrtUrAQzheQ0upxJMgjNKOFdsxMC1Kcg7hJoXcelEQxduTAP0dQRSE
         P/l20jU9xA6AJfxw4EzzSUUBF1V4FWstKlFMMTX87H9B9OUAfCiZ15I5HL2s4WJKpN1b
         nh+4821eGR4eFOCP4n4ol+aYRGTnhDbeytIG7o2IqoUDzmeJgIeI7r3mHPWXQxBDqDwu
         taSRCM53v4hLLxsAJUJicPVE95RSyF3pTlBP2aVMHvGlhmgMkJ1FXdl9lbRi6MsEO8uj
         cqGOHUC26lttaDqLT4HVPhcfXH3S6UpSNPMH4xYVs6Qe378qzowY4OqxX4MRQv88AqjN
         tIew==
X-Forwarded-Encrypted: i=1; AJvYcCVsTIDRuCjI6RSjX72nPAA0BAXLuYgeOqf6MgnyXIqJOWOcJQjTUeHJd5DaE09OVci3x1ab9YJTp3ObnGIL@lists.linux.dev
X-Gm-Message-State: AOJu0YxDEsnOtnWssYCkwK1nPgGspI/hBQy6M0u2i30H3FQNkQBygP2I
	r9egNfDhZ0d5KvOV7Qr95HOcyNVTIDWy39LKqFT4ePUNhCP+UT+ez7HgCIFMlvg=
X-Google-Smtp-Source: AGHT+IExA0IXeN0DpI3sjIu5CKqv5XLwnffzuIUhud55a0AvlWAI0prPHTf6ueNt50V82PQLu1aLVQ==
X-Received: by 2002:a17:907:72c7:b0:a86:9053:d93a with SMTP id a640c23a62f3a-a86e3a36950mr198914366b.31.1724763993148;
        Tue, 27 Aug 2024 06:06:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e582d43dsm107637966b.115.2024.08.27.06.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 06:06:32 -0700 (PDT)
Date: Tue, 27 Aug 2024 16:06:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: vme_user: added bound check to geoid
Message-ID: <5cca227c-045d-4053-aed8-4ee020291e9a@stanley.mountain>
References: <20240827125604.42771-2-riyandhiman14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827125604.42771-2-riyandhiman14@gmail.com>

On Tue, Aug 27, 2024 at 06:26:05PM +0530, Riyan Dhiman wrote:
> The geoid is a module parameter that allows users to hardcode the slot number.
> A bound check for geoid was added in the probe function because only values
> between 0 and less than VME_MAX_SLOT are valid.
> 
> Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> ---
> v3: Fix commit message and remove redundant comment.
> v2: Removed unnecessary paranthesis and changed pr_err to dev_err.
> v1: Added bound check to geoid
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

