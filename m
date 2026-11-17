Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920725;
	b=0Odbfhy2aWVzFNmGHAg4Eb6ZbfOh7pNvmQ6MVM1obP7HOaf2c9eZ0ZlVjjxghr1KOSVs
	 t2WuqzSKz45qUzCRsyK+AM7JllHV44NHEJ+3uDvAsatChvf/h02uzm38/RvKGUp45hhmZ
	 urlroCvKVLkRlb1YmjMmWGORx0gVjyhpw7g/AUjMbW596NEQkcQfPFK+SEAbz+6jaPcFx
	 JlgdkRyEGk3jjtP2tvNay3XLQesdXSI5QxwGCxG31DythOFVe9FJrtLzx7Agx/5DF4aaF
	 0L3B8OFT1bF+OOpeGq8+ls5Ufx2COipqExTW2kResfeHkeQAOd2E/O8SG4b4mD1LCJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
	b=R41VvbWQbS4SeLrw/tE1AL+iypwr1Jn4/ZgaVjTApRKA5wLg+D9zhe2sB8Ghl/V0svXt
	 SH6smXXeGlh9is6Cv/3WwYXOTPEYKVdYAV6l4zlbOIBFx4Nfivs/MwJgT2Nqk7EyqWSpA
	 vdQUsEsHclO58cK4qd82qrqZ0fkbVXFXDHbYPZb9ubpz9ApYl68PrLWAxy61xBc3fTc0n
	 xa1+IZZ28Cx/EyoLz2AVdDyLhA9aL8oUtYoppsSZFV6KbyRr40ikOO2fYT+etm90Xt9EK
	 FtEHiCUxMlX3kM4IYR/7POtROBL9tvwQZSiNePTwGWdqisNfck3I/l0rfmAbpJsNLSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DlEUV0L;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A863D606A332
	for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 13:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A863D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DlEUV0L
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso6452702a12.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Nov 2026 05:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920723; x=1795525523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=0DlEUV0LoaT6XQ3duaEOZ9uM6c2/YxwBthwKLbyFHQATRo6kZ6DFvFxROGHq8YNFtX
         hSgJyRv7kyquvB/qpc2VZzZXp2imJRtc2MzUQVYmBUiD29QWz1Io1bbDxgpEJ/Kl0m+V
         KtLFDr3Z4YIQzNXbodEMZbWyULfjClYJvQrXjn7G8Bc3Th/oRX7P6r4CCwdEqhHDXmvb
         Cr2a+KfktBJiesF5vaFGwGxM+34t5ELq1WPU6ennBAqkTPyq408H5sqqGAyMMLfoIiYd
         VAjUOCOFgASf5bF80d20pBIPkjVKS3DEtBP3Ba5pBi1EUwb1PaeJ2YEiGmJtuD2S+wwj
         +eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920723; x=1795525523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idu1RW3ysteFFCmLuOlQ/aqPD4nZPXDeX2QMvTFnWME=;
        b=W4g61stBALuFCddUgwYjYQ64qyWMGO3nZrChSj36vlhqibLEUWPESyr1vxBerRzQiw
         x1YoBbNDv/cwuY41sl+7uZRnjK+3HKJarZ0NK4WDVkgwoSbFDYnfpTBdWy4PbRLfrUf6
         EPzeG4PhuBE0AtTjts6zJlLJUm59n9ghRMA6/pr9SDlSFN8BO6cOnn/j+JBoiyLEQHUI
         BNkEDoNaHI42L07D6lgebF62+oRATVgzjHwB5fov68iLcSuK/HxDcF5hLg7O7j55Ir60
         CU7y3M70TpXHlitBCL81ABT5Vw/TbQOxVnjbh51egIhwR6VSP61UN3NW9lrZF8us9RDU
         FNDg==
X-Forwarded-Encrypted: i=1; AL+hErE2DZs9SHD3amhlFspnH94Wgo3rMbd9UEGMZKcEps7dO/6FGL2Ld1NCTj+yz7gIiylw802KoQFKuhhCYexv@lists.linux.dev
X-Gm-Message-State: APuU4Z+akPVXruAFIpikaj6SzmIYDg/jz7WpprJDUb6FySgCrShWdFWj
	vm2nJMV+cfv/ryZwrRnZm/L8aAEpABwmfEgcsayBkcye9RmqH33BzpQV
X-Gm-Gg: AYBFou08H6+rysJpbDG2wbGhFj8489IBV3NINxC9hgshlutT9I02UvRFT0FRk9NLVxf
	CyQBwRTT3Pzl/nK2aAPDvCIHdocnMcdLFPA3ATZ+2cmsv6521K85DSaaV8sv+d+sDAOhlwi3gfB
	UPiv9GQzHG4kznfdC6CHHgoul36ytwvdSEwUN1tZfvPdoGYDW6bLEJHmzp0W/PbL5ALanZ3VTA/
	2HKN36y7pIyAjKhLMB8TIzEp0yutkREFJhlwhk4VOhw5Sjj8ir51SJwfroO2JbAaQJs4/jLbziy
	o0eAyuJRdYiMAUBQG0iVID/TJNWNdKUesZ6KQdjwC/Heefaietu+RD14ZodGQKq/3xkrZnDtw6L
	8QgWKY+xgrc6mXs63+1EjHiLPPstBtDFdGIfFXKwmeiNnh8BRHlMJ4EpQ8+eKp3UB/x6LA+yHWe
	s88lh1Vy89rSIoQg6Ejqep6GRkdBQJCMitrn+/uoVpMRTR1TQ6hqO/e9TMrF8kuV6WVA7azC5Wb
	ej6jX5/kgrHfzVqIEdnhXQBeUd8YijdjGgoQOKT/qrjyiCeDOBeCJU92JNlaZblx6cXffEfQSvE
	EP1JtLlS6UEeSpfYRZq1zyGuBVqKe8tm6wJgRx4G/kYf3Zkf2x+ifPosalOkT7226D3L+Xw++ig
	R2HZRpzK8RTzGwZu24L+NdMhZpYg1KGr3/8jocK0CU+LQHsfcz55WraIARYcaX+lJTLY=
X-Received: by 2002:a05:6402:912:b0:6b5:9849:e328 with SMTP id 4fb4d7f45d1cf-6b7c0d12623mr10169278a12.39.1794920722795;
        Tue, 17 Nov 2026 05:05:22 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b8786f205fsm343922a12.22.2026.11.17.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:05:22 -0800 (PST)
Date: Tue, 17 Nov 2026 16:05:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: atomisp: remove unused functions
Message-ID: <avxRDgUd-uygzKot@stanley.mountain>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

