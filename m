Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A3368282
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013352; cv=none; b=FLGnNBTMpR5PgO38mP7ehB2m7llEyiJbQCBnVHrz4DpeAK44CG2epEFJBO+41fCdGF7LiCbfmg7LkU6uG/B9ZlArXPQTD2lngsKr7id6k1P0O8L7NIx+7yLjJeU2MkUrEi9y0rnAopWJ2lJXfS2S345DiKz+OOSbpvGxhqxuk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013352; c=relaxed/simple;
	bh=H141Rol/s91YdtYDmDq4sqT8D3wkXMjtdEljbEKZvLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxcWQ8TbaZnmfn/Cuphj8YSfvUG9662WXTSar6O7zIlY7mlvACJMopAkNJHfIHqFbV+9cDofAKaiRM8KJlzxZ1WFRYXFhDixABKUnJUMnnpjivdYYmH5h3Sn+e+t0iLlPjN9/Gd3r8R1viipxKpVgy06ggQvC6MZ4H+L6+YPAKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3iAIjQ/; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3iAIjQ/"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb68bdf53aso1581221a34.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013350; x=1784618150; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+9VXYQoFKrduQQaI0MXfTWAOznl3U7BNrRUoVoj9CU=;
        b=H3iAIjQ/GAQ1Fo9v4a9Ufg9LG8BiBS84nBEREXUK6NRApGWiSEocAP7MLkmrAPqPUu
         1RHJexDLdJE/sAj9qLTmwhR5jDe5UyH1gj2sqHe+UeUgb+pw9WBJdtkicC3l9nCMyF/K
         C5NqjzLfkIBPfQCohTiC9jefhel7brf/0VP8S7TwUDCZtE4buTBV0RlOCfAvOyzNARbu
         FVNf5hqsOSlur+RaBMXB7otStE/jDemcf0inlAvFxUdyhoQrZW2oNVWBBXJCS4ukGEOT
         2ETpsaSm+MFwuKqqoB65+ADXwrxr91wZOKtDif3OG1eoAKoYFchE0NpaNWeXt+M66Rfj
         PzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013350; x=1784618150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+9VXYQoFKrduQQaI0MXfTWAOznl3U7BNrRUoVoj9CU=;
        b=RPLF/6ovf1oi44BFuLTxRPhbbzczJI3VojekNE2nNV2sGnjUnOTy60ZVzubQHppnj+
         vJGSzmYm4x54sGFnNp8n3RZydRkzlIWU5wiTxqjx+r8klrvBzX/GqbIwgYyazCF2c/R0
         u+3vwqcS2lTNO78ttj6pCODEGb7yk+iSsMbV8W05RhOZZmXCXix9n78TFZ9LpO+y55HH
         Z9NL4cy7n68B8bLeV2s+KwFIGiSHHYCnWy3svvOJcUPv/P03Ksm5Ez/+DDILLkmszD16
         +A7/XgXCyOjabeOCNyqLDAepWlhtfS59GtAPYnjsq6VMPDtLsRFKuJHmA3FiF1demPmk
         qgeA==
X-Forwarded-Encrypted: i=1; AFNElJ/jo3HCcLxBVVGYRD8u3i1phI5E3DcMJsUJdTqC4eI2MqxByF4gf+LkO9l4gz/8ZzlWc669ziJIruyOBa7c@lists.linux.dev
X-Gm-Message-State: AOJu0YzhYtA3X4QoizkXcLu/12OjxsVO1IA+5DHFCwZneXuTT7ve2hzk
	hAu8792ANP8vHQDVdH+RsG/+H5v6+QDyecf3S6PSBs8S6lpqpyOPVC2yNHJwDnpxUC0=
X-Gm-Gg: AfdE7cmZE8unYx0H222C5ArGbfCSPmNnzFZk/2lbUcBJkE4xexETlu04xDzZSqdXIYH
	Dcieg+5KVkoB20g8bw4tZwWLWTj+8pj2wanv0fpVG9EWLJfA5Hk0Zs4Uepxrv/jFXd36Mf5YSsJ
	tpBuwOG8o/+Mitc94tu1QF6Bdl8577GbS27qftPqiGzBeQsbIRUilzsS/qrDGJikp8dWhs0ZdqH
	ujSca9KNGJDi6CE/mW14vTzaY2pv52DxvB0UUyVo2k4QtjsR3j4y+FjQ65+KHtTj7/YDjq71W5i
	fENgSDc0/Bl5/R1lVt+NccjYhRuuxVMUe5Fw4DGQBvpzHQTP0sIbvZZVD1ZQJTPASeuIig/xT9B
	3gGls0fPN4Z+ITMMAozZdP1OGGB1P5MSgDu9VXa59kTN8a6oSyjHU7Na7OJLWadmktS3ADH1thL
	gI4SOK
X-Received: by 2002:a05:6830:6b05:b0:7e9:c481:ff8a with SMTP id 46e09a7af769-7ec096782c6mr8345084a34.11.1784013350259;
        Tue, 14 Jul 2026 00:15:50 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec14489139sm6778498a34.5.2026.07.14.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:15:49 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:15:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency
 and UAF bugs
Message-ID: <alXiIGfZjTeaD7gm@stanley.mountain>
References: <20260713181602.773-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>

Please slow down.  Wait 24 hours between resends.  Otherwise it's like
we are hovering over you watching you work and holding your hand for
the tricky bits.  It is overwhelming for maintainers.

Follow the other v2 rules as well:

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Also say that you are using AI and haven't tested these.

regards,
dan carpenter

