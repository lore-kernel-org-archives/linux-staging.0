Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992295;
	b=ZS20QK9SaRl9BLQd+KyW3gQgH+2MQLabv4vASgtTZyberfLWWOJMM9ALGsttNpx2uiMl
	 s3elAHMmUkJW8E6alMjddNZ+bIY2Li5z7PSw1knJRjjb6HJwz9GV2ExgTTqSBYYYYeBME
	 5y3Fvo4lPqxpSoBOPWHeX4e7f2rfbr3E9dNAq3OoZnEBQ2iypasrMdYiVwVMzSpU4TYJ4
	 cV1Aj29jiYCXvD/3qd3XGXQ9o+ar7x2ILejAk+mXqVWnXC7rkQ37feGBM/5rphPObQrDY
	 hmNMsFFpofuJW9HPXd7hyi4oB78xWrmxWw0Xuo9rXq0hY7aSsUmzOIlaBYQXJ64Q1QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ZgSdL6UNb0hv3GzdEIBvzrpCjmu4Nyp3OJC5/hXrbc=;
	b=vUyl4nVw9uylSJH7d844r4snHsHHAPx1wcNGPOXZkUmdMa/OCCp510bBR5l0CrAfv8LA
	 JsMRrx8oonWNCHOlJbtGh2sWIfVPyir23GHWXF3vrR2IebM/rdINppDf4sMlLV/eyti7f
	 d3sCN2ILXQV20lN/O8So1qY4nsWO0FaIaFuLBx1vL2nYM9ysoHPGE0rtoEI3ceo7CzLuC
	 E3fqeSjm00GlXPIXABFAAgdeLzifAD8cm2D8/GMEdYmGAIALKrfcwXBKBbQ2KAXeZN7gS
	 xCvfTENDU/j0fi74wql0z0UkIvPCy+FPHwbYeqVN/OIfqnu20xvvbQ/IvQclQNhB3xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oLDRJ6yr;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199B606A33E
	for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 08:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C199B606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oLDRJ6yr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so4921015e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Nov 2026 00:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992293; x=1795597093; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ZgSdL6UNb0hv3GzdEIBvzrpCjmu4Nyp3OJC5/hXrbc=;
        b=oLDRJ6yrfw/jtAGhpaS/b0228/y4ZOKs2GfL5pIh6uZOEqpFloTALu9jHG8E3vMxJc
         FstlrBxzfY6tN1V2VwHw4G0OOC7Y5xMxLsGsY+i65EkO3OIO4353ijJKOzYS2D00Y5Dw
         QiUSqwtjITQWc54FrPYiQg6sqm7sZ887pIuVu7OJNROQvKPAKsmEEUfodrHejtGaTBjl
         opgASPUguhwCpv55mp4+fOmoVcxjEhQkwUeK2vp9SRxEBM+mJrCx2kgYGLOkvj3u2zaw
         8tea+fg6jldhKb5RqIT736FFVMab+J9loiLyUCyld6S2YaUXxuH5F1np1oSHDHbBzN5l
         m3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992293; x=1795597093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZgSdL6UNb0hv3GzdEIBvzrpCjmu4Nyp3OJC5/hXrbc=;
        b=LJzcKYa2Ui5NfGTAKOfgGyQOfKrUsP3XT50MQlDMaMUMRdp0DGZLBgY1cITOz9X4Yn
         gAaIq6WFqtdn5TQQjhKRUTIOjoyeb2LWb0QO6u2GCRRYeF36N7nbOESRHxmcEm14RMWo
         Oq0E12UtaP/AbQ+QnSahGdY7YR1pInfv/xAIiPvN2i6IagotlTTdsGcRVepg1SQiHsgk
         CEfWUUNbjRqcsHbVjwAwL/02emKg6wSweB6oMG8R/Kij4qomZ+xz+kPlcaoPNwUemzV1
         wZxRJMxqetRNGALOrTlXyz8QIdFyAOor4PG1H2SDPXXq7l3NGxbi91W7HwMmuPMcDWNn
         TWjA==
X-Forwarded-Encrypted: i=1; AL+hErGSXJjtXYhx3JDI8O0k/sb4uzPXNja5BtVJZSsJ7tSTEQMJQqw2ID0ZLWgHi0fJCauctmbqldMjOKox3l9Y@lists.linux.dev
X-Gm-Message-State: APuU4Z/VChZr7ppNGr8KXqd6PVcHqtqP7M3vNB7BuFI8Z5KrmMTcNVdY
	wRUf5RKTft92u/l2qJk0lJQ5NZyvqoLLrdPAJ6Bu5tQKMbPtyKe62JO4
X-Gm-Gg: AYBFou1GihWqfNVKd8LnPSJwOysrXld9J0ZSdgNqP+/AnidaMb+S3Z+DIvGOMRWthdN
	lqzd0nQ7PC2wQ1CPppiJiArGglNNhiyUSFIvQ7KAvzKzX5+CvVOZE/lorbBSMKdToZ1rlRvqNSC
	qKCudQLUn0Bk/Hjr2S0F2H/q9cVV+7X4Kx4jdR33UQbxpuAkOHlksmRYMAWVrEGaZaP6kMD+wuv
	igHS0V+ZjONQ4CNJ3blv1nP39rxOKdcnnT3eErwlDUPjhh2vlLMRcUjPnYFzXjcLSA7em0YT8r4
	gRfas/tvKVkXSz1HCHWrBwiL7FWSJ2N2E/gBQA0AnRNTJLVF01mYNVHJ7qECozGntAOes6M7Lch
	TOp0kCOpJHWKpt3WGxJR1rqBJxYb4wiAfTyBBBVNGro3RNpGGLtRc5KqwGiDgsMv03Ar3pJ22G7
	RXrompRwBDo5ND3CEVrtedKryJFAT3PhSqg7oXZBXXxkxgp+vXO8r7o1fGyk9PpNmAk4t/0HTls
	G9HHah5zErKXPzJsOHghZ5ITd6E0dcHapcRgMdmQpEc4YcSMtvEzJ0dH23cWlObaDe/y2mrjLAC
	cnYZBpFSdK4aG4+Jwp7bciSjm8jy/2hUht0oRLIxo1dmlWDNUVkgjcXQaZyY3F2eQWlQYbqb6gP
	/ItSWEuwYLm8IChKlrvcbRYCeB70zNcvqYCEL/Fpfh0MmnVARxduJZK0eFv+paQelZtI=
X-Received: by 2002:a05:600c:c171:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb7da283b9mr33351565e9.19.1794992293167;
        Wed, 18 Nov 2026 00:58:13 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm49455655e9.1.2026.11.18.00.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:58:12 -0800 (PST)
Date: Wed, 18 Nov 2026 11:58:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: DelaySystem@tubot.lat
Cc: shyamsunderreddypadira@gmail.com, marusik.adamenko@gmail.com,
	rajveer.chaudhari.linux@gmail.com,
	parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: most: dim2: use atomic_t for channel state
 counters
Message-ID: <av1ooLApGizPA0tC@stanley.mountain>
References: <20261117-staging-dim2-atomic-v2-1-a550f0518043@tubot.lat>
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
In-Reply-To: <20261117-staging-dim2-atomic-v2-1-a550f0518043@tubot.lat>

On Tue, Nov 17, 2026 at 04:06:06PM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> @@ -682,8 +682,9 @@ static u8 channel_service(struct dim_channel *ch)
>  {
>  	struct int_ch_state *const state = &ch->state;
>  
> -	if (state->service_counter != state->request_counter) {
> -		state->service_counter++;
> +	if (atomic_read(&state->service_counter) !=
> +	    atomic_read(&state->request_counter)) {
> +		atomic_inc(&state->service_counter);


This isn't the right way to do it, because it's no longer atomic if
you do it as two steps.

regards,
dan carpenter



