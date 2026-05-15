Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8012D7DE9
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 12:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778849865; cv=none; b=hS3/VfgN+D0zDu7fV3EpTmCTeS++NlPjox0OwSsO0an5GUUr53zBx1Wzmwc0mdOTGKKzhUFFqVH+2bPw4XbpLt2h4JVmZGDL6pu9B5RzDmtQG46Hd7j7JnUz44x55HJnnmJ9ytmu3Ro30cSMuxorbXHeLAOnNRm+bUgPp+ou23Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778849865; c=relaxed/simple;
	bh=pXaF98NnVEhVmTRyKaVX6gpp/pdi7FtHbhAmcrlxqb4=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=Rp94McnWZYJhKpCB4TXHU87gZyyRE8rizzgIBk5nWgulDp4/ih1gETu+mvk2eM+MjZ603N0vDphvVGZYLrYprBF1lQYpQdk/IP995Et3o+tcNUesmZZdEp2vx9UUi6EW9Z9l5YeLFYpsSFuEkZ2+7ihyOqAv1Pj7TPCJSSOU5bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoVzCLFZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoVzCLFZ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67e24b8ef55so13250553a12.1
        for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 05:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778849862; x=1779454662; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXaF98NnVEhVmTRyKaVX6gpp/pdi7FtHbhAmcrlxqb4=;
        b=qoVzCLFZijNhaXO8MfYN6+/2SmcCgn41MZBCBiHxfOCGoAq2qnoB9iXSVTO9GwcvhV
         gz+rYVrwrOGdQ0f2hFVfyIPe9pCPlddEpgkidlBNOuYmQGiNPb+FhnICdtaYTGWq8CE9
         Xsax9iygdIydPI+f9pYD76LXwzmPxuKnU8tmd3JqcTM6yxmt56SvD1YFyxgTQ3DzPDuS
         jAjS61eQyQxErXt96nQ27Hzsh30qKFyZHw91FSJt0ALMvrdTV5YfM3eQeRVl1NFCnUhj
         uxQmEd7A6ka0QrbTuFd7nTdvoECIzDTYYOs3sr+EL2ZdNTO63Bwe6kDQzFAJAFNYjkUs
         7tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778849862; x=1779454662;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXaF98NnVEhVmTRyKaVX6gpp/pdi7FtHbhAmcrlxqb4=;
        b=FjcbVu0MAPBYL5zjBYBKmJJlK3eGKmD/DlVCM64KNFtbgmidl0H/RVy2WFF4klCHI5
         be+OsMmqOA3kZ/5zPEr+H0Zu1xbXbFeIs0E9/dIH1ZBlRRrXTmlPKLbmjm8SlMTxPrvs
         8fFuzRXuakamaWnEmUEvYu1RZbX61gTYDz5pg6aSd+dVq9tpX5yOj5q4WtOR5OvXhD5f
         fSah6k8JvG1P+RMMZWt1bIZ5rQqQ9zo/c5LvReiJN7k069niegdSSk2NkT62bekw3B8/
         09glUuYVqABRw7laKFRYe2o6mVtZ1ssOJs0fOHMOWiafCOFl3aAOV83LPG39pzc3LF8z
         zO5w==
X-Forwarded-Encrypted: i=1; AFNElJ/QFpn29lRyF7rntn4WdZYCPl8CTj5H/A6ACIOSBeN4UyLZTOeN80SuXRO+XRgIfh1X3IrQFt309HSVR1ew@lists.linux.dev
X-Gm-Message-State: AOJu0YxCpGxkYa69CZjUa/GF2sTI8BRGFPbJ1ZroAU2w0TjbISwpq8CK
	GQGNziF1DmJDOeLqJMmv1SSafaZd0//RPsAfUBjHOJlhchzXqK0yXgBXY8GCIlHIgEM=
X-Gm-Gg: Acq92OFaRLo+gtZWFlQEWupg4nFhb+WMa3mct6ZlE9fLwzL8h5s5oshMWGTDF46E5Gq
	bXHD0RS3G7hz0+b3IQYss/O4T8TfXm8xhQuRlylDVln8I9d9AMDv4Oo9Lmsj4V+SqRbE2k8vnd/
	6zZAaCMfUlt7IF11ocFf1VNvxawpobOxF1hO8vFqnwuvDmMdIN630Im2nj2FIJe6ZWTxEh9/rlm
	zuDP7ornZmse3TUYXmxKtyusNz8kmdPLr9tQ0ESS0wUoyI/HRGa36A8Af4Yl0EvcXOlLTu5BxZy
	Ops6a0+Pn4Hrus8NrAC+UxTmCHe8p1KSr0cIrvTjvLTrebxO6Xc0PmYk2jSqhRVxYlWUJTE4OSi
	ZPbmm2ONtEkkRQBILO0vnyZ7b7CGqEMSSGwHXOdfVwAiFfZNTD6psIvrW6VAAFzukHhoi5XCc3h
	TR6vdwNFxwiIPo8tJ+6rawo0KgEZrSp/meIzyS1M7FGnNWc9DPJOq8Z4vfZIR2F8uVABuChqe22
	bu9mD0LUcO9ccxrlXtxzl7coUrHJ5gwTr7WUUg+SGP1KJOIO3ojEfNRaDoUudemjESIUvHSt16o
	TPnkgbECbmUMzHz2PTHnxVa2hryV
X-Received: by 2002:a17:907:c291:b0:bcd:be80:63b8 with SMTP id a640c23a62f3a-bd517ad60b0mr221323166b.44.1778849861983;
        Fri, 15 May 2026 05:57:41 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm2053126a12.8.2026.05.15.05.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:57:41 -0700 (PDT)
Message-ID: <6a071845.fac41930.11435a.01be@mx.google.com>
Date: Fri, 15 May 2026 05:57:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix OOB write in HT_caps_handler()
In-Reply-To: <2026051526-impatient-feminine-17f7@gregkh>
References: <6a06f87b.669ca06b.fb7de.57d2@mx.google.com> <2026051526-impatient-feminine-17f7@gregkh>

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMDE6MzQ6NTJQTSArMDIwMCwgR3JlZyBLSCB3cm90ZToK
PiBIb3cgZG9lcyB0aGlzIGNvbXBhcmUgd2l0aCB0aGlzIHBhdGNoOgo+ICAgICBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjYwNDE0MDgtZ3JpbGwtbWFob2dhbnktZDFlM0BncmVna2gKPiBv
ciB0aGUgb3RoZXJzIHNlbnQgcmVjZW50bHkgdG8gdGhlIHN0YWdpbmcgbGlzdCB0byBmaXggdGhp
cyAiaXNzdWUiIHRoYXQKPiB0aGUgTExNIHRvb2xzIGtlZXAgdHJpcHBpbmcgb3Zlcj8KCkFwb2xv
Z2llcyB0byBib3RoIG9mIHlvdS4gSSBzaG91bGQgaGF2ZSBjaGVja2VkIGxvcmUgYW5kIHRoZSBj
dXJyZW50CnRyZWUgc3RhdGUgYmVmb3JlIHNlbmRpbmcgYW55dGhpbmcuIFRoZSBmaXggaXMgYWxy
ZWFkeSBpbiBsaW51eC1uZXh0CmFuZCBJIHNlbnQgdGhpcyB3aXRob3V0IGxvb2tpbmcgZmlyc3Qu
CgpGb3JtYXQgbm90ZSB0YWtlbiwgRGFuIC0tIHdpbGwgdXNlIGdpdCBzZW5kLWVtYWlsIHByb3Bl
cmx5IG5leHQgdGltZS4KCldpdGhkcmF3aW5nIHRoaXMgcGF0Y2guCgpBbGV4YW5kcnU=
