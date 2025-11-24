Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ED636D4E7
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 08:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971522; cv=none; b=RR4oh8VqbxlIElKDp2ghOedsR/uF3Vs0mtHYAsB20pVmTcAYOctg1adBkuRbkzjjqo9XJqb7fG34qPQIIIaGSQYBnJCPiVJz6dhunOoWhvaVjOnPrpOy2Cm6RL3FIe2CrRI8LealHC+wX0M3SG42J5P30IurjwTl85xi1clVP+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971522; c=relaxed/simple;
	bh=93452EB620tCOVE6CdHJwAE1M5qI39NTQFahOSQAR5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWJaogBmagz7OQoPqboFdB+tYHnDjIwjwDtHkdyGeRp4SZiKiGjjt8hh9i6QA//ruSVyGu4YpFerdvxYqdOxDzMrromb1jyNz70z/kraL/0IlCsdp9p91l/lQvV4mRFAsubow5MwgDA/pNHOgm5A2+QxSWndGqu1GcUsnBFWfUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=amQprf38; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="amQprf38"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42bb288c219so3476936f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 00:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763971518; x=1764576318; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2bmDkURDxOy2WJzHQxx8tLDW5e0QoNw46GQCQQ26b4=;
        b=amQprf38KqqJ60JhWdezbuUZdk7SVbdwCsi5ppo8O9t2pfHFxvmWA1N0t9V67bm6r1
         cCi99NVPgD0n4/EZMgnxusPe60LDPKrX/733XFASsJZs3+3eIyVHD+wNVF3dWxdi0DO6
         tpLXlmgegKSfro3UY2UxTHEbchwdBkgSmJPR49L0FNKfJokIUnZGy6FimxIlz8eWWjBW
         CP6ylkzhfxxEqOi+jyof/3ilkhokS+/l35WaucxI6GsjMvm1i3LBJZvkzc0CZEpjN1mL
         MZa0yf8++Bb2V4AakavrPgBdMioOUo0ulPxVU7VactRMrmfz2nVIhz5t1sWMwrybhmT+
         5lXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971518; x=1764576318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2bmDkURDxOy2WJzHQxx8tLDW5e0QoNw46GQCQQ26b4=;
        b=lJjeA43KyFFbQY+S/LXmNMzqnk3au2cyMa6sqjoArI4w3riEn2huC7ywAPreS4ltaV
         7WFBoQs6RIHWXFMK/VmWmIF7ilh8+hR2GhxG48f/sI7By3HBYBtlYH9vZnKnSyHJR7G9
         /AMl6sxxF74cSSQas3JBNTsXwV1gBq5GYgo0gOYzSfsQrlCe/QVngnpAHgaFNp13w8Jo
         x89l4QRMsm17KSohyyiU6WtF7DXafatEDrdZD55wj/kCcS4fYPrlyT234FYVaZKSA3MC
         YabNeznfcXyBeHWQEko+q09HVFO5QfMjzQGCIPXDDtN59owA7+0wrDT9EDI8sBIQkUJq
         RPzA==
X-Forwarded-Encrypted: i=1; AJvYcCWs6c6b8qv0TzB1t0Kedf2+HU0AvkBXMbVJavuRNuImhZV5kU/nssMP4DFrk/dnryB0kbNUA8l7GMdKXccA@lists.linux.dev
X-Gm-Message-State: AOJu0YxYBus7l+E087qxgMpiST2XQrrTAOIGI5GjJKer0JFVhVlmqVWJ
	TB+5eskhMpcT2T1H/UU7lw0A2/vGHG3jbkH19bnmvoqAN+obkVD7hgFiwx0Vfu5qq1U=
X-Gm-Gg: ASbGncuUkiTxc7ztpNfBaCFFMOFx5j4fhDWt3ZZaBHVeLFsZdLl4iIRRZrWFARkVLak
	rOQ8SiDofUoHPulw3jOWNpgN4OhNhaUB+bJXHRIOjGgtvEOqK5eMa2ojuU1GDTSgT/58i4curCI
	Pf2YYbx5QVDK1xSjNM27Ve7MqSc4+lBlbLHu3QVKi3EE0KfruTzQirl2yI50L6czEJkpGbB60BU
	5rwnvuZ4/41mhOfgq7xQfkKbD2j8dvc4uxvVb9FPos673f271FdRQQ1zVi7GEP4DmWeB0SyEEiF
	K3wNyKPd0sL8SxpRRpFREjhdIVhi0nm5OT7CHjxQP/ZYo5gx7qfq3XQjQCdYJTpjHiw3GEqpQuo
	k348zzcP0G2BTRDlJUC+8szg+D0N3byLNuxbHm4i+a8klrPNO/eRiZvMdCnIxSgfWhOs3JHWGQ/
	s2Qzr5bfRk6Gk72UJp
X-Google-Smtp-Source: AGHT+IGzKcXqLox5Tb/VUp7uIATtVnidS4hXd7lihaZJ58aIMGtOAlRTw64pXGhUDrjz+xkh2VfZCg==
X-Received: by 2002:a05:6000:2411:b0:42b:3a84:1ee1 with SMTP id ffacd0b85a97d-42cc1cbd1f6mr10731102f8f.18.1763971518387;
        Mon, 24 Nov 2025 00:05:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f34ff3sm27340790f8f.16.2025.11.24.00.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 00:05:17 -0800 (PST)
Date: Mon, 24 Nov 2025 11:05:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: most: video: replace BUG_ON() with
 WARN_ON_ONCE()
Message-ID: <aSQRugdpdJjWe1S9@stanley.mountain>
References: <20251121190909.115556-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121190909.115556-1-pavankumaryalagada@gmail.com>

On Fri, Nov 21, 2025 at 02:09:09PM -0500, Pavan Kumar Yalagada wrote:
> checkpatch.pl recommends replacing BUG_ON() with WARN_ON_ONCE()
> to avoid a kernel panic.
> 
> Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
> ---
>  drivers/staging/most/video/video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 32f71d9a9cf7..3a622bd597e6 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -575,7 +575,7 @@ static void __exit comp_exit(void)
>  
>  	most_deregister_configfs_subsys(&comp);
>  	most_deregister_component(&comp);
> -	BUG_ON(!list_empty(&video_devices));
> +	WARN_ON_ONCE(!list_empty(&video_devices));

The start of the function empties the list.  So the list would only
not be empty if something were adding new entries to it via the
comp_probe_channel() function.

So what is preventing us from adding new stuff once comp_exit()
starts being called?  Figure that bit out.  Fix the bug, don't
add a warning about the bug.

regards,
dan carpenter

