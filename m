Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F051DD9AC
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 18:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772389533; cv=none; b=taVjQuK6ACF4S4jejXqcruKto0VC73FR+rvJkA0VDNXOdw8NB211Zerl7oqg3VjK5cxrf1S2qx+1fJ3cutFLr/Vrc0Am9oYToyNkP14qZKgY1s6DkELLskIUJ/mjOqoixp/VUk95gAaB8tOWVe5O9zSQrVtO6a0um6uFE9l6ve4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772389533; c=relaxed/simple;
	bh=UR1WWLt1Bg5kSEhTheijDFdivee881Q5zgxrUGwkrGM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nu8m0+SaI6mquCbpo34WJWZ2l5kCiQdr0WURQbIN758DO65VUzuqHF0W+ErFt9Ys4YhrxKua4S5sP5AZSdOs7p//PGvJR4ze4s6i1Ol9HLR0UAfAtKusj5gNrCqqUc8Bl4UEAsilwo5ZjhdtAqVMhEA7pnJ/JnVMFZscBvXVgRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giSaEOCG; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giSaEOCG"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78fc4425b6bso34471347b3.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 10:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772389531; x=1772994331; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Y1h0lSG+oxK+iI/xc3q2TaUSENNAIiWHkUw25ozomc=;
        b=giSaEOCGLZ5tR86SUiLy//A8J6iIzY9ZKHeEa448g8/HUCht8yToKNJFVNY9svqyPB
         hsaFR4NVThCp82nFCjEp0+QMOwZl9nki54PUf2eL0ps8Ug4yUqatxhvjJAzY3fSJo1Mb
         gDr2tPkpOOC0aLKRRZaAtSHEbop+/1vSH1pfvk6nqrDgkiGeGMNCHxjBmuNdCBtYfPrY
         ql1E7RKFH8td69i5OBKe2z+U9AaPhoMzpsPWABX5saAOkaZKrqhWMdSHc3HqYC2hKv6X
         PuIU9Xiu55H3wwNieXY5QOYIRng91CIlLF/FHcsu98aeGQzeNSg+op5HQPF37CnLU5gV
         ea5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772389531; x=1772994331;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Y1h0lSG+oxK+iI/xc3q2TaUSENNAIiWHkUw25ozomc=;
        b=hNbAqFtzxNHyU5lcGTVT4LRq5INpx3mJHE1YFeiqrx9TO93GUxnlsmUVGfKDSJ+HoM
         z5Uojf39o45LLHME450+SBbQHoQRezkNgFuvvMRwu+YDXBJFpCYcBAUi7M78oYNBQr/X
         BDZAlRh4Rbvzxqrv1CRTa0pEcBFzuPoj+sO3Gn7T2IedjuTOtTwxYetohm87oluEcXLg
         KW3PRwmx65qYfohuqJkj8yen4eWmePcbYtE1chJlBZX3C6XEhs2rZuIuK00ZLkff4KzC
         LSDW0ITAcENes2cTZdin6mDDfEfbkhPJZL2APuR0BT8Ct4YySbh3l1ZON2/uWhMII6Tu
         ff1g==
X-Forwarded-Encrypted: i=1; AJvYcCUIAkD+R2keH4PJkRnD5Y3k3jcKjfSeMeqtzq55qPdWMrsv+RySmH6ikj6DdgNk51Chv78ySqclJDw3S60p@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8fBI1ITtaNeNL9jAE259Ti+oaKRUWH6rBuYQiuaQN6HQh4NrZ
	H0lQ/AAH5cs2zv+YCUbd03cNloxlNljXUqiuyaDhvcGK/MwJRc2vTita
X-Gm-Gg: ATEYQzyYmeGRjBom4ND1vkpjkfIG0Joh2WkroMBatuQ645mKTiiyhx+HTw4FSTNIr7M
	0zWQ+RBHF7pPWFgHci7zElhPjdI+OS9KnVGab7ymrVk8rMh6xrxC5p9X/Nwj9O68arvf+5XDjU7
	CsfCBtgrYK8klYnN4+3t55OuRfkdAKVzLwetZHB6t3rwcqbTJ79WoQPtONWRetcK8Swi9nlWunc
	6VwN6vVw0krx06Q5wknhgr4lJus1IoAG1pSMD6LZO1OfsjVP0f1JO/EcVMU8Ab6LH5tj6pIAs1M
	XJguLzQVT+KXtJyvHktkGLwnhzu/nMNB/gugD2iBdqpl6EGGEqH4nKYOYd5cPaZDrPwJeybVfpr
	Vyxehc297bGfo6X1+hztF9kFoZ70hkzTIXNCvrCsX6mgL+6bTJZIvpNAku9sgnYd2M9x93bHGQO
	KVEOZnlXWuJ1qmwO7ma3J1AArrwkhU50dmQ0ftE1q6l1iMQFC3irh4/GRokKIh58i3Np5dfVJJ9
	oCf8oXkk10fXxHDoSzg8njz9R34gje+
X-Received: by 2002:a05:690c:10d:b0:798:1adc:67f6 with SMTP id 00721157ae682-7988545e6c6mr88937357b3.2.1772389531260;
        Sun, 01 Mar 2026 10:25:31 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798ac64fa32sm2032567b3.14.2026.03.01.10.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 10:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 12:25:07 -0600
Message-Id: <DGRNN7GOW93A.WCB013T32VIH@gmail.com>
Cc: <ethantidmore06@gmail.com>, <dan.carpenter@linaro.org>,
 <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unused 'ratelen'
 parameter from rtw_check_network_type()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226141333.9909-1-nikolayof23@gmail.com>
 <20260228130917.4123-1-nikolayof23@gmail.com>
In-Reply-To: <20260228130917.4123-1-nikolayof23@gmail.com>

On Sat Feb 28, 2026 at 7:09 AM CST, Nikolay Kulikov wrote:
> The rtw_check_network_type() function takes a 'ratelen' parameter, but
> does not use it in any way. Also remove the local variable in rtw_ap.c
> created just to pass a value to this unused parameter.
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---
>
> Changes in v2:
> 	- remove the last 'support_rate_num' increment which is not
> 	  used anywhere in rtw_check_beacon_data() in rtw_ap.c

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
