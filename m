Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806654;
	b=RAww9/N0vLqnCBtSl1L47y1AHYU3LhF89JdXzL1lPOz1Dmd0br+LFVG5gEXkvV+7GjKB
	 e+/I3t7iwGHm9UoGUZ8z0Gsu0CIfbL4fPzwwbjXFkAj4XDmxA9YPXaUXdQPZTq9ABnEoP
	 7vw+sHlrn1+GnnQxCcw2DiFo1a/KOiUukTRLMj/ZNdi3TF+/CfYCRtt8TAAvOz7f+157r
	 6gljranZxfSLr9Mrp09paifaQ/ZQo6WHeEZsnMcf0mrZjNEV/2NQrBS885C6IoDN8Ts60
	 K0P/6r4PA84GHCPkw5CkNsxYvL5ZcYFVhKEfYyTaCqUtv0rp5d4N04eM2I+G5lxXD6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nETJmKCVqPlTrkNAEmg4/bOwp28yMSUgmfSsOnU7Qbw=;
	b=CjsEU6h7aCZKaXu6CkN606yteZFdeQoOrjhyhXerzZmth369iMAu6QB4dqSTl67R49rJ
	 zKEDgROdoZ/FL7d8oBUe3i8SbgarysKCusmLmRfywTo7Y1SixoxShAwJ1y/VehswA/Azx
	 XhyVhUBBwrBJsGleQc+AynhHCPqRPbxHznG6zQW/lbl3Lce9HBQ+wehRUgdMhOmd/hmqT
	 8AcJAo9DlLqHSZ2EMw6LN15O1sdz/mM+omzEyUTtjBI7ozDPaz4h5a1rJ/srvkMYonOwa
	 R9rgpdYQPMRco5CPkWZosAPHmT+bCQB8gDUB8GfLbcEVjb94DnHNCuVKYaWQDx3SpqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yuw2RFc/";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2F8606A31C
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 05:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C2F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yuw2RFc/
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1463700f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 15 Nov 2026 21:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806652; x=1795411452; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nETJmKCVqPlTrkNAEmg4/bOwp28yMSUgmfSsOnU7Qbw=;
        b=yuw2RFc/Rdr2ALDpnGP2h/AZ4xOBUsRfuFQo4xPaZNbOrH6tMXYSTZT98rYodtT/3Z
         WmOhHLQKSqmvb2K4E1enYuB/xqiUymF4nxD4ZdLIrgBLdy0+FOEFEGqMvcekX4PdueyW
         VKf1oGPa6FSKfhU5MnAUEOg5zaiNgBNP3E0mXYkjp0dHU+RC1sGA8eNK42YWCT5v3xzI
         97KkDqFebn7jj1A28HnHYrC5raHan7ENxVYAUAnuNqz457oBFfUY8MTHVgylueI1EOOl
         jstttgBQNykYysQjDHq9u//dRtIWU2rHWeKoaMf9Qd0G8eY5IOOnIXQo3FHrH0+ZFKh/
         404A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806652; x=1795411452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nETJmKCVqPlTrkNAEmg4/bOwp28yMSUgmfSsOnU7Qbw=;
        b=Vn9sKB55GfmwfiKoI2n150D4N3siI16+LZsR8f3FBv/n54/eWbgCgH1dPs92dkUp7a
         uSaKEpvvRczrbqlzdQQyaja6rU1CbYm7CwvolRg0Tb33A9bLXFnmCcKlC8Z6ubsjLd2/
         NAxT4MqSLFZvIta9dNyKgkvMnRhRwCDTiCKye6cfHr6DAUJQId4p9MR7DAc6G568TCW0
         6APrGTUBluvMWkEy1dRFQR82vAejPJfIwudpCMIWAW2zVq6ZnWz1U5iDyqmyimEnoTNs
         MXeGsnmJtzvr2DLeLWZjA+iPz9XAB2xfWyNwltbzsV24KusFwCiJeMjswOUfWWBeDKQp
         xGZg==
X-Forwarded-Encrypted: i=1; AL+hErHtkPElO0JpoDB+xzuzOzVGxzdxzutlf2J5dzqaw7VM7chLh/5PKHi4fqjn360Fzpzcpfr4r2gZx/T6uHse@lists.linux.dev
X-Gm-Message-State: APuU4Z9rTMFDRBjTrjPrAD9xC6eXWwo0/OpRU5eX1k6O44B1Bd3rOycc
	r3bGS12o29hghwGQ55EyK4pMH0HkSbcd/e6q9EO6XYQeC2IcRi4Y7ALL
X-Gm-Gg: AYBFou07cRKTWZR+YPLdYf4xJ0FrKrfmW+PDtvdIRCDMiarDcqR06MTlnuI7eZS56jm
	fPZjJbaiYD5dOjOCFzANbtwWiJOBr+VUiPhWD5/KCzTh4EAynaSsRC4mKQ6inUPvgoDGJ96StoP
	02H/lhCtHnCpRTeXC70JoIS9tZOGCphndnUh5JCVEwLLeLpTMHztT2F1xhpnaiz8XYksgfuJOIy
	z18Z8KLr1e+QLSpfJdpzwBiRYqyUvy/kI4DXUx/LRG4FjksWzbjln1M56YdOlqQ9qbLK7W4+PqL
	K6P6MtAsHne1A4cHErZNUa+x0s5/UwLUyFUxkmV1RwFX46ozgZCzC3XBL5CkpfwIka3m/3g9pGO
	FVuwWzSNIGr3Jz4tEMjj0JfZk2AlMEE2M87X1Ojmm8OTGUcd0BYVfAvMKs/N+nuoR2xAJ6CZR/B
	gmjbm/jDhjCy9m/eiQZei+2dNjH06lZUDs4/fbwHcd0dC0NXe4/zcwlAe72XgLtlfAs0AE8bFlm
	20I+bTOoihzmMFLfqfMb6zlOpPsa8cqKNXLeZLIdPjndIOXvy8Fx5y83k1HOvjVUfMbktQNWEHp
	FfzaemFi9/+hT0Rcz1f9cz/+zuH4BpxsR0UaKvg9gr4Jazm92fHd+zciV1ZbqU9FmbCdlAusg3v
	Tm6wylG/EYTw/qG/hpWOeP7fpoW6jBz+EPSTjpVTaQ5GH6ZrsNvq+bYWG8YoBvavDd/0=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr224061135e9.0.1794806652295;
        Sun, 15 Nov 2026 21:24:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb64ec7b58sm194039565e9.5.2026.11.15.21.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:24:10 -0800 (PST)
Date: Mon, 16 Nov 2026 08:24:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Leon Pelzmann <brunonick1801@gmail.com>, sudipm.mukherjee@gmail.com
Cc: gregkh@linuxfoundation.org, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: remove ineffective sw_i2c_wait() busy
 loop
Message-ID: <avqTdwA-2E_-lKL9@stanley.mountain>
References: <20261115215427.112315-1-brunonick1801@gmail.com>
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
In-Reply-To: <20261115215427.112315-1-brunonick1801@gmail.com>

Sudip, Is anyone still using this driver?

On Sun, Nov 15, 2026 at 10:54:27PM +0100, Leon Pelzmann wrote:
> sw_i2c_wait() is meant to insert a delay between the bit-banged I2C
> operations, but it only consists of a loop that computes a value into
> a local variable which is never read. The loop has no side effects, so
> the compiler removes it entirely and the function compiles to nothing.
> With W=1 this also triggers:
> 
>   ddk750_swi2c.c:95:16: error: variable 'tmp' set but not used
>   [-Werror=unused-but-set-variable=]
> 
> Remove the function and all of its call sites. The I2C timing is not
> changed by this: the object code of ddk750_swi2c.o (x86_64, gcc,
> allmodconfig) is identical before and after this change.
> 
> The W=1 warning was found by building the driver, and the change was
> prepared with the help of an AI coding assistant (Claude); it was
> verified by comparing the objdump output before and after the change.
> 
> Signed-off-by: Leon Pelzmann <brunonick1801@gmail.com>
> ---

This driver is old and when it was written the loop did add a delay.
It does the silly stuff to hide that the loop is a no-op from the
compiler but then compilers got clever and saw that it still a no-op.

The busy loop was added based on testing and is presumably required.

Your patch doesn't break the driver but it disguises the bug to make it
look as if the driver works.  We don't want that.  We want the bugs to
be obvious.

We have some guesses as to how to fix the driver, but actually we can't
do it without testing so we are in a bind.  We can't move forward
without testing.  To be honest, the most likely way forward is to remove
the driver if no one is using it.

regards,
dan carpenter

