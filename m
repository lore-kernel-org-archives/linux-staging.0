Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0E30CDAB
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778850773; cv=none; b=jyWUeI+zFF3+zKkufm/SJI4mYc/aB/kTLNUneKyD5QZUOX9pwoOn4JncIKfKqlzYa26l3+QRiBh3YcLWU/dz+CfJvOSiQnz+0AiNV5LdHi4KY1gJOl16nSl+Gmxntd8aPv/u8H2zzsyliXVNGsJPmkfXyY+rB8FkNbWwLh0Rd7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778850773; c=relaxed/simple;
	bh=/G/h3oa2+qOV+YzlBEWQmPswQ70lmZH9hY0xbdROWho=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=JM8azcpOjkU41SSAtETt4NL1aQSEFYx7BH2QxnY3Z9xgLybjN89BEs5kXnh/5MxC/iYffWlEFA95caF6TzhatusQulCQmNvrGldqC4HLlSkxA0U2sdqpdjeYa31UEW2JRMYuL5Y1S3EGaizrtUmhTpVb9SufzrzMmz+zw8megW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKKaNSxO; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKKaNSxO"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6746d0b2b4aso14376997a12.3
        for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778850770; x=1779455570; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/G/h3oa2+qOV+YzlBEWQmPswQ70lmZH9hY0xbdROWho=;
        b=OKKaNSxO0aed8HVc3RtwIQcWLHq1AW5q/h8w3LEmV2Aq4x1/79/LO8eZ+FPxwQ6G6+
         kk/Xfary5lAQH9f2yCcvDNf3tQ5xAsunMlkY1NDqbTVDWHag6Vs9Z710ifOrbctLwksR
         ISEOVgTP0gDTW7v9oHw/j+xOVnEzhEuLEJBw3cdea+hO/SSxnPFTZfQxWL1YJI+eNppf
         SZwxmbC089T1cMTMqcYix/MFwfx0hJorBlINdkzJm/JTleAwbreJBOFZfWU9Ec+342VE
         iT8WlwW90lculeE8NgYlyO5LuREvFLzc12zyKSrAWYR7XcJPEjeiiPa+TRh5snVVdlR1
         MThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778850770; x=1779455570;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/G/h3oa2+qOV+YzlBEWQmPswQ70lmZH9hY0xbdROWho=;
        b=sm3kKjnssszL0eZS8r6sDBQIDcqJb/RUOk73FBMg1Mvj4mXHwCYOJQEbE8+sOpkuND
         ugpkJUgLUPVQtI2f+NO3mivWBQhSQKya9crCMtoP+BtnusuYxMO4dZWGpYwPXhEUFCyn
         xg2zeKC2SpwBx5ydDx0F4ebIZ7AeDWUYoqnjb8RxEcCmwBNL1oUMCgxt4CFtwffUi+yv
         k/kKujsZryqdUkusdykioyM7XkgWw24aMYvaMQjSkSyGtRXQ5xws2Ya2+4XEFEgQqgxP
         081cl3BDpGo7D70YiuyiaovkapQSw5VnMIyfb9qopM5pqPdvd3Wl9wfH2pYfLPzMeqKb
         f9SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PVCg4nAecfO0eft7gEA7SyNU/J6PllX2L1nBkpR4CXa8I7LcP5ajSPSkTCFjfelukRJ0bl2YhzqqpucNy@lists.linux.dev
X-Gm-Message-State: AOJu0YyuZJVyv82+uscx/Pci+ggbQOxaDfrVN98qRhx5XVoYE2NoUUI8
	NWQcQ55Z77fRXk2zLIdzx6bCic7B9pzQ3W6G+12mfALMwGhq9AtzDbO6
X-Gm-Gg: Acq92OHhVuRP2Yp7y0J2aPFSJGnjOZ9qzolvG9/V/v9JcvgvbGm03QAi1RqZwlU28Jp
	PCU6X181imY5SkpLQCM/L6lQXEPX75li1Ayoqk/RhZ7iajoGvwPj+2q913Pv/rgspu3wUHR0Jtn
	vNFKpRgx4ZsyNVq5LPxyj7cnipGvkhlHRH4VJIkYPtC5aUuGqZT9BWImGqUcO7To/dMm6UoHVPh
	bOl1UTiqP55gKySf6AXYqWgNUpp0ZlOmzwCD5BJWDsaEC+8HVnmnZxRHJp3wGEaEvd1uuzcqCuz
	Bs8N/eKd0QxqWnRNXXSQaq8vC593E+aqt7r86QH1f3m60onaJrpl1ITs1hbADCFbSDwiDXqwX5S
	rKai/R7spXhuGG4XnYGteSPOPkqYwmzGTWGeFRHWaEvSVfgOe66szIuQ+It+zIzOy06gX6UOrzg
	omtUp5ztDgsrPhk3fMaKIIf25N0J6P1K9AU0m8ite2MixqwPmqWAnB7ZKcqIoXQEApvr9LpAU/t
	cY6ziryQCdhrEDQL+4tMg3QpkPWnjRBmjxThjGJvKlyf6hHDsmsfhXKAETh4NdT9rp0hVDBkKtv
	jBjD98cplQPk+vctVVY07X8rWjfs
X-Received: by 2002:a17:907:785:b0:bd3:a112:c9a4 with SMTP id a640c23a62f3a-bd5177d46bcmr213404466b.6.1778850770229;
        Fri, 15 May 2026 06:12:50 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm232424066b.9.2026.05.15.06.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:12:49 -0700 (PDT)
Message-ID: <6a071bd1.908e0b5f.32acc6.5951@mx.google.com>
Date: Fri, 15 May 2026 06:12:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: dumanmehmetsamet@icloud.com
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()
In-Reply-To: <EFE3F065-DF2F-4790-896D-8278AA30341A@icloud.com>
References: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com> <EFE3F065-DF2F-4790-896D-8278AA30341A@icloud.com>

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMDQ6MDE6MjJQTSArMDMwMCwgTS5zYW1ldCBEdW1hbiB3
cm90ZToKPiBXYXMgdGhpcyBwYXRjaCB3cml0dGVuIHdpdGggTExNPyBXaHkgaXMgdGhlcmUgc2Vw
YXJhdGUgdGV4dCBvbiB0aGUKPiBwYXRjaD8gSXQgY291bGQgaGF2ZSBiZWVuIG1lbnRpb25lZCBp
biB0aGUgY292ZXIgbGV0dGVyLgoKSSB3YXMgZXhwZXJpbWVudGluZyB3aXRoIHNvbWUgbG9jYWwg
dG9vbGluZyBhbmQgY2xlYXJseSBpdCBkaWRuJ3QKcHJvZHVjZSBwcm9wZXIgb3V0cHV0LiBTb3Jy
eSBmb3IgdGhlIG5vaXNlLiBOb3RlZCBmb3IgbmV4dCB0aW1lLgoKQWxleGFuZHJ1
