Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B903C9428
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944713; cv=none; b=N9hbYThKu0jhLrg9TZ7Ra+z5aARTMeRZWVdr9YFshWjxFthYSpxjmEd6x9RBl8RzP2SEpx88N0hc8CG5jNk+qgMR/9eiikIV3AGCGbp+HVCh6YlSFdzdKizhdZDys0m3FjSfupogSBo6tSh3IDsfbUYVdIeay8Bml2JXqd3NhpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944713; c=relaxed/simple;
	bh=c3CzEXt91LEbspFZyuSES0upRZEK+NbyD4fvGu+sU90=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hL3Hhw/SdFGcrPaVN3T8HoqPwYX/ieqC6EWLIfnl4+DwrWBOkdiRG1T1HjP4tCyNbyza0idLDdXtBXgGGrxE3fnOxXjS0oC5F1Xz2XMZRDenz86e1k7knSfgXHF8wdd7CS6CYh7kQmzm4nlIu1SG4Thq7CvrI9uddP8Wcd33l7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClaESCdu; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClaESCdu"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-793fdbb8d3aso10398827b3.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944711; x=1774549511; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3CzEXt91LEbspFZyuSES0upRZEK+NbyD4fvGu+sU90=;
        b=ClaESCdunYFCH8YnRIhlH8g+WYXKchXb6R3rNQmKocAR790qIYSU02t/IBAH1muPE7
         AI1ULaNefnkCMTZ6TxpGfMKbkrO4G0W3X869jNQJemZqFtXIX+7Xu5wJUx0sieq766eF
         ynNPcnAsF4gbP0nmLU/eD/qn6flBeu7ILtXXURsCy6uT1D8NIKChazP1E8BS0dLUYTiZ
         s11nnO+mzcQTMtOUKOrUodgp3xA0oCirApQgPOXEWqKnqJh/U1A3qgBBwTPDK/MDNfsS
         8iUl69UcEIRQiq3yMv6g6sb1AvtIcyFHxFgKLi35nItgVFzjtYZAoX71kcaU9m6dMZd5
         0gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944711; x=1774549511;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3CzEXt91LEbspFZyuSES0upRZEK+NbyD4fvGu+sU90=;
        b=nEJCM3lV7BQSMJi7Vf5bscX/eaWZS8Sd9sjzEiK8719UV6tFNb3Czmz8JI09F8zrdE
         iVpBqZ5nr2JKc3A6WahYCgcEZZhknB0vgz6J3GaP4sISEaMKS19rl075l4i46nKVcOL/
         VowJMIc2z3eHnQrqWX4WpFNJvwMTFY5Dus4zxe65OvYxap5oV3nhfo3AH5cixjUm41GG
         2LqZd/xml9ft/qEu8cfnFPbDfGhP6SuszbZpCiKB+UOO3qFAQzJhsk1AWW+J3I032I42
         gP2wVwzOQyl2kmCWPMYK21tYLT5DCFEYlIEinPWEY7tmCVMuk8OItY++fAkjFYaXZ5xi
         Wq9g==
X-Forwarded-Encrypted: i=1; AJvYcCXdrtR/SMXXOFHo9MP78/jyDLjynxHK7xeJnbheMIhpt4htSQ4ls0jo8CT81G9SDWdGydKGEFWlXhFdWG2x@lists.linux.dev
X-Gm-Message-State: AOJu0YzpcDdANO4DF7w5lfSDzfeRo8qwYCkL2uDJSQ9QrMwF6WLvufXA
	34lVKMf00HkYpGgVyyoKeUxSI6xRqwfE2XSWy0EU+3wx6z/12kSTaOwN
X-Gm-Gg: ATEYQzzf1HzgiTiOu7zwui3hOhkt6Jlm151HEiVEz5sJqILgcJCP+Bno/V8hBz6YIgo
	FSEWA4K/KiCh7RFS/PW7jylIfgDtscZM+NcRLmI0D4Fl1G3tMOXwQDvdD+mImL2khMC5EHl6feS
	Ia3taTqusvZ4RPuxrwd1He8BCYOLPUv65G+ZoMZRt5bukUIwPH1MxiQXNoMYO4DSJddT62tygXf
	KpoNCFm1YjYGIXDLQ1Qey9F47V27rChNIBOfNPfjEG7Hxvfg2DjBVbSEUenL7P961yExe6+AQXU
	EfemXxRnEPAp/clFDhJW6uxlCY/oRet1jr5UPUI8bZ4iu9H+IXKdwVDhrzsShuCgMPgPIiLcqWV
	fJNczMttbHFP1X46qHJMN1Poa/xb4OdxsY7cDuyjN53wQaPumDPcaYdz+f+28yDs4R9MOKeoeV7
	IxlfC7zQK3gsRwrjOgq7NJqc74HFvDDybIzD5huNBvDXTqnUZpOyK4rJiM4/LytB1ZY1PiIX23c
	DzNz9vYeuBO260kQFjL21FfdiWdwuA3
X-Received: by 2002:a05:690c:90:b0:79a:3a79:a4b5 with SMTP id 00721157ae682-79a90aa03f8mr1577137b3.11.1773944711073;
        Thu, 19 Mar 2026 11:25:11 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90552db6sm1419557b3.27.2026.03.19.11.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 13:25:09 -0500
Message-Id: <DH6YX1BYWJEG.Y4KGQ7DH91VV@gmail.com>
Cc: <luka.gejak@linux.dev>, <ethantidmore06@gmail.com>,
 <dan.carpenter@linaro.org>, <linux-kernel@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <straube.linux@gmail.com>
Subject: Re: [PATCH v4] staging: rtl8723bs: removed dead code
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Aadarsh Mandal" <aadarshmandal9354@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <2A37C741-68A1-47E2-AB3D-833593B5C392@linux.dev>
 <20260319141818.7735-1-aadarshmandal9354@gmail.com>
In-Reply-To: <20260319141818.7735-1-aadarshmandal9354@gmail.com>

On Thu Mar 19, 2026 at 9:18 AM CDT, Aadarsh Mandal wrote:
> - removed the dead code.
>
> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
> ---

This patch is corrupted.

Thanks,

ET
