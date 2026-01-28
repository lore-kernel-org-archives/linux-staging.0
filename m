Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA722857CD
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616591; cv=none; b=cNcAR1schrKIXDN/BxyUXKEDIRo+ZW6UWaWQ0JRn7PgePaYpa/jCB/77WtXd8fRyZFBiCZUOTEySpqFp2XxaWT69CQ2oZKtqPg8syaVu3yLFE/2VUW4fmnVG0CVuiSH1lQ9E7LB9uWYRcL3nlWkIBFtrplF6H8DItOOT1WB96WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616591; c=relaxed/simple;
	bh=YLp0xMhJD91K4dStVEZKvtdm0bCagfjJ6PoEOtEDm7E=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dKdRynBZFkvOjd8+RTUXrq0HS9gO3KtQRGkZvjV+B6kNcbhyf/KWFL2gzYqXsGqGKUGcVoyEJ+heKTrGuFD4jss9f/PMKewx5SzMicz4YxGzbqRHpw18gNTQb1mcreTkGOd8wiep1CCTqFLq7njgSaEdreBQXoeAkwbMrsNwX3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqxwI6Gf; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqxwI6Gf"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so12342955e9.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 08:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769616589; x=1770221389; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oo2JNKhxBR2/4FYPmxLFmOYHpJgIq7EGsENfcNI9NbA=;
        b=iqxwI6GfTKn4LsttEiud8J5FvWeeY3tuZeOfaqzOvTE9yYV7B5/p+CSJ/CyRK+kxNi
         UJMzyGz2Zzu4nge4u64ic/oos467BJ23+55RyFHKaNWuLM9UqhriyTA4m/alolt4+10H
         elia2dkTnNqSvr5c26fQyefkZ8mCgCc3pGn4di4J3KsgCi1CtjBPHGXB6IYG23uM51P0
         CK99fUCLz5miFa7Nj7vsA2zVwI2ssxXNT3DcLVQ2soCDZTYcpsJBJeuX6ypKJpP7f4D6
         KiqHD1JL6PtN8ZhXSw8uYCUUMX7/ZRI5Hg+mRy/ZwrfuR0IRPShudN0Fp/MOkDjMepqS
         3FHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769616589; x=1770221389;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oo2JNKhxBR2/4FYPmxLFmOYHpJgIq7EGsENfcNI9NbA=;
        b=ABvZWl8E/YqfnOAN/huZjZCdBnokeR7xWi+OPk4ROxcST+w+rgDYlwkxyWduHG5Asu
         X2t0m6uE1GH28npfGh7geNB26/VSUB8cvqVUsRnKXzcPbcnv1ja/Tq4LVOsGLpMLhogX
         unpCrpkHqGN2k+xSzRHPsUJ1PuZzaKrBzeXgJNgUdW5DstxJ+qu7JbNzzJZJaJAxGjP0
         koUx2AImtpChsXI33XLjm6lQTFLAOcEvhldJ5xZEkWCx0mJTWqRBY8SjCe9G78+GkdoJ
         ueOr7tOLgG8og2FXZtj2E9xVP9dS3z9bgI7w62/U2r2FKQAFTkcql1Kv2Lx4oyWsnF8q
         gZYQ==
X-Gm-Message-State: AOJu0YyAUTOc3h8DXL/kdXITUXdwCjN1s7ud8mciXr7Of1l1V2BEn/0i
	/R+AObQPqIVAJuRTzMEFhveiOKLq6MiaNNjhsxOwGGCjHblROsHA/DKKqdDElCNUQaA=
X-Gm-Gg: AZuq6aJc8qhj624/okSD0WhNIwMr7K1zCRnrxNFaBLmcKN+yv/m3gK8TMzZycftdmnt
	5KE0oZ76lI1BAWYFjPmH6mZ6F1VxvtXxfo/hfVZFKR2w7VjjDEHavFml6aMVrBjvc4uRFGEJsPx
	157He5wjfN6LI1C8yIVLvEFv/Z1Cqv963wlHkKvyj7AVIsd9rlVCJW7X98nppKyICmD64dg6JKH
	GHRMpDMq49vTnGCWOnzQ3M/kPIA0mzaw9E3YPQ2aOLmnadTOO9K3HRl6SOMmmszHTZaWe21kLPt
	edMuF0CW1jSd+vY7sv9MdfP011NaVVDzPR/CrFw71K6s95cL5cljOl9eRWnrecvdZMOzj7zEe7X
	4Q8PK6vG18xVBbUpctZYCvbYQVOsciDXxeusw4e5FDhJjkfRQSnRf+YrAzpJEqknHzMvpFAqMOw
	JPYx7C3MEVO4SKM8VAp0y+YSw=
X-Received: by 2002:a05:600c:1da8:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-48069c165c6mr88846405e9.6.1769616588524;
        Wed, 28 Jan 2026 08:09:48 -0800 (PST)
Received: from localhost ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm151967255e9.9.2026.01.28.08.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:09:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 21:09:45 +0500
Message-Id: <DG0CQ4MCS7P8.2FW5L1RVCYB6L@gmail.com>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] staging: rtl8723bs: fix line length check
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
X-Mailer: aerc 0.20.0
References: <cover.1768736361.git.mahad.ibrahim.dev@gmail.com>
 <ff17af4290ee04d9a6c57777c7387c782bb779e7.1768736361.git.mahad.ibrahim.dev@gmail.com> <2026012713-bovine-tricolor-d747@gregkh>
In-Reply-To: <2026012713-bovine-tricolor-d747@gregkh>

On Tue Jan 27, 2026 at 7:40 PM PKT, Greg KH wrote:
>> -		if ((cond2 & bitMask) =3D=3D (driver2 & bitMask)) /*  BoardType of ea=
ch RF path is matched */
>> +		/*  BoardType of each RF path is matched */
>
> Why the extra space after /* and before BoardType?
>
> thanks,
>
> greg k-h

Thank you for the review.

I included it to match the existing comment style prevalent in this
specific file. Not adding it would have caused inconsistency.

However I realize this violates the kernel coding standards.

I will send a v3 series that addresses this issue, as well as fix the
line comment style in that file as a separate logical change.

thanks,

Mahad Ibrahim

