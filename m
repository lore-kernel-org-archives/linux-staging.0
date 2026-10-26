Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032935;
	b=U9ySANarMU7nIvl8Btxe2VvkCM7MF3FzOvIaEvNWsFwIfXk05eGgW6/jOoh6kig0ZCYh
	 7zn0spEf7qcLjuZda2v9s5bRoGPSawlknypwIkiAUAjXuxW4rWcllu5F7He1BFy+u2jvM
	 3YOm2AwmHw4XCcBcJl0m2x6edeVYvtRRrk+gtW5bVXBDzy5PJ+UP9BHIcZ7kNaGFhjhYd
	 kThmUBPx4LkrZHjC/TECM1p3VPdezKGIGRpmzPVkfyb7NGJKueGXJXgUsy03BZ3uuJcsH
	 aGi4/ziJLDe5D28Www7IVhjzGfs7nPGYJdXNzp1WpWks6/COQ49TCEI9Fcwu2JG9fUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
	b=Wxk/sRrUmlTVbxaQYdC6xECJER+BRuN8LGm4B6cJyPFRr4df1j0JfMzm6M6f9z/31eaW
	 +fk75lnsErYJIlYutTF7UnuCTTiW/vswRGamXOXJgBfXvLuDhOV26ArVnNWN7Ta6RkH7+
	 r1Pk9sz1BuA6KiQ+mVFclkbfpwkHlQmdvVWMj40+WNIcyQ7kzg9yb631wTyPrc/QbQ9mt
	 Khn7YlFBTImhy/Py5J1J7NV+wmjF6iiD7UihbMbY4F165WVnyP43o6kp/Om8I84bxU8oa
	 yCrSbJgiPgE+cLUXf/MBuq08232qc4s4UY5MLrbJc2iihMrq1fw2HVT9GBJS1pHgpaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=klpICFAc;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337E606A31A
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 16:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9337E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=klpICFAc
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3025261f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793032933; x=1793637733; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
        b=klpICFAcSruhKP22YwctlPOaK1ZVLLDNqlHHhUw/3Y0s2R1OsaROCfwCilYYdnx0bB
         Gz+3/aaXe4ccxOkMuqjf7w0HCjd+03q3DeOXbaIOLVEibcDgdYz/TV1qwTVUfxATXj0H
         40b1qvUK/wd4PRpAPwu36eOfOpWTBkPTh6BD2hunn/uOlo6RsWhOZOzSuiU2Rgf1LQKI
         TnFMYCme49rLb9Bwp+puuInmOOxSZH9XnVW6AXV4urDSceKPF5weIGgxqrRcfD1h6ROB
         XKrYHSCLsLBlaK2lSRSP6J/aO6enXcd71MlU1seOH6zMJpMMW6m7tyPcmNLng2xDG3rw
         qGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032933; x=1793637733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZdnB36TYkFpUyJUmp0mF4p0xDjkPFbcHCtRdEkoFgk=;
        b=jS4P3oy4SmmDCgBpxauv1d5pBcX0Glc+FVJ1j0NF+pYwiS/T/4ZvHIwFXlPbYcaoge
         Jpnbz7V1QJRgb4HrF2PnWe+1wxOoY+7vBG94rOfslSj9e8sjPmzuMyJqXek1YcON+ZZg
         03iMt05wfaM00MuB500/jGtWoTAi3LakHT4wDOvQe4o5HHlkTUQjqFm4xJDgB14hkB9I
         tRRG0EyBvrFxxtQzt1bIqFPVa/oNj5JX2DEi01fvfqNE7j7uVr9K9vSeTj9iI632nDmH
         s9tvUUyMqD2WG/0FiVZhM7ic66p4tpWo20XqTsd38D+feyuvB/67rhje1Sw6RbnV6Uxn
         OeEA==
X-Forwarded-Encrypted: i=1; AKwUvBwY9dGYAsCOyXItnLV45VUysQfcG8aVj2AwJPS4dpqUcma550sVvwSMUwu4SJO1Ouc0NidBMfQUkejpaXzG@lists.linux.dev
X-Gm-Message-State: AFq9FYImhqp+T7eKAibR3iKx9TX8KQwxE7R1Q7yFsaOvmAUA39MuPooY
	GdB43xEdsw3M9L9DjFBfLuGlJiNgRXngIWK7Tr1LSSxqljyIeXn0CHX8
X-Gm-Gg: AYBFou3qyXtG3s2uHwQxxFF6EE2nWuIdUgY3+oCBcBlcaJAGwLDS4NfZluLuG6it5Xm
	v6iJ3zGw4145rX5Vq9h90pm2hqbR3GGLeAThYeCovIU1Gl/Yxw3BjFYNcL00PjOQJ3+jdDhaceM
	sdcuCDqr/8L604mTeft218V77Qd2kpO1bmhBzHCrxG+QsD2igZY6j8cLI5cT4LzxS7ortb/fS3Q
	VO7WPJtrcxACtdq/lZXxglUdDOZObqCnooyz3akFoMJs/c8GbDgJkXR85SPAisUxlJuNzmzX1qT
	zgpMR9nRlplvWVGLei6n+Vigjw5dSniwmT28yrN3Tayi7IGPxFeQC8Tc5Ohi47TAaHaOS4j2JTf
	fh32Fy4OngEydgg1OS/T1Ai1Cqys/GoF/vhIVElswQnCmpGe898J/cHyPqKIAhXHHtesmiWMyky
	0e5i1PnnqbyO6bOBD78bbrqMUJou8ozPQ3rLJC2VJGXWGEE11TtvuDT+V6rr6Y2dlkLjWlsG4QQ
	8cGAmAZl/rz4YkFh94Kds62fNn0lGLve1nsOkiwrSvAYWD2wMMf
X-Received: by 2002:a05:6000:24c8:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e3eb922a2mr13567728f8f.38.1793032932768;
        Mon, 26 Oct 2026 09:42:12 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece14a1sm17879800f8f.57.2026.10.26.09.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:42:11 -0700 (PDT)
Date: Mon, 26 Oct 2026 19:42:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/media/atomisp: Initialize curr_rules in
 atomisp_freq_scaling
Message-ID: <at-C33IuUEms74EL@stanley.mountain>
References: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>

On Mon, Oct 26, 2026 at 04:10:58PM +0000, Abdullah Mohammd Sifat wrote:
> The local structure 'curr_rules' is declared on the stack but is
> not initialized. Initialize it to zero using empty brackets '{}'
> to prevent potential information leakage of stack garbage values.
> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>

The commit message says it fixes a bug but there is no fixes tag.

> ---
>  drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> index e66a7d1c7a0e..d4de2bd9a0a5 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> @@ -170,7 +170,6 @@ static int write_target_freq_to_hw(struct atomisp_device *isp,
>  		dev_err(isp->dev, "DFS target freq is rejected by HW.\n");
>  		return -EINVAL;
>  	}
> -

Deleting this blank line is unrelated and wrong.

>  	return 0;
>  }
>  
> @@ -180,7 +179,8 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
>  {
>  	const struct atomisp_dfs_config *dfs;
>  	unsigned int new_freq;
> -	struct atomisp_freq_scaling_rule curr_rules;
> +	struct atomisp_freq_scaling_rule curr_rules = {};

I reviewed this and the original code is fine.

.isp_freq is never initialized but also never used so that might be
the confusion?

regards,
dan carpenter

> +
>  	int i, ret;
>  	unsigned short fps = 0;
>  
> -- 
> 2.53.0
> 
