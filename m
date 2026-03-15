Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78AF3FFD
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 01:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773538098; cv=none; b=CaEVZmW5FBNyAdJOILq51ovin8xSqmrKMGX+uAi60UpsBaid6rwmWq0KbjVvSPSLcrSEwwK2zY1gTI001gUkBqFle9kJtEG7jpXbRLqARKgW84FHgoWWdrKkyCLJZ8v1PS/wqPq+GSpJcPsmEs3HIY2BkxrUUjQKgqfsdnKmzZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773538098; c=relaxed/simple;
	bh=hZMWNOlF6T1dJmove2N/X8wh4o0NCvn6VqtDeHpdEoY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sQ3GVfeClfih/l4s8+VRuj2f2CC78yFfpmp5RPM9HXWBDTB7V7f7ZpzGEZMAjYaLbjLFtX9Xqj00PpxQUDiMD8lykuq3tUn4yeWDpqxoDA3xWdbh+x/BE2+4RRz6ATUOOp1981f2DT2rtBcQONK4bgBaKQF7Jz3FRWlgPenfoZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACRwzsXr; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACRwzsXr"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ae2ce2fe1so3313528d50.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 18:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773538097; x=1774142897; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZMWNOlF6T1dJmove2N/X8wh4o0NCvn6VqtDeHpdEoY=;
        b=ACRwzsXrjs8KApO1rJjJEwdAzOQXVT2VbQYRZ+xpFBQgC1/FGNFCwC6DgMlZWaU2i9
         aV8fBCUC8g+A3UPQWI/F5tdJifABBnIKjEq/03O3Xf1d/kkq1HBml/iEq5m6wAxm+U6g
         MFhcIxJaZfU7epCx/bL7/9Kc7DvM6ise6Xs0HwLpY9UVOVig6A3CItHBWh2ggcFfDJR3
         oGtMgbZQr89MJdgeIDFLWD1UFIOBo2AUDLgC7XMAUsZ1LXyHdockv4ealy0K12RHUXsf
         IKFNXnHwQaSj79XJIUScn2iBUEhYBWkOB49PslWRnvICIe7lD02ivPaz9IJwpRM1coe5
         1PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773538097; x=1774142897;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZMWNOlF6T1dJmove2N/X8wh4o0NCvn6VqtDeHpdEoY=;
        b=HS95blgJMmugT9fvK/HiHZUch84Nb398gyabL1CeeBP1VTDx2geGKBedx8miNzpr6B
         hrtDrNClEL1FngZygenu6Sn8YS7JQbc+B34k43pxo5QG8YSp9rPNwC/BR0ItqRqzRn1G
         kKMsTc48HCygPNR+0ntbuh66CLHumM58OHZUtvrDYE52A8eVDdmEc5HoA1jaDjdJOnS2
         YRw2Jr2BGOVZQO01KIU/6oYeGKsW4SPMhnI2/y+K41k6JfhxpGFqKLZ2jZp8NTFgrQyO
         6SM2c3NSjcSm20IQ7PiZHxs/W5osIbrdSzcMmwI+JITNUmy9mgFtmwGmTC/R6gckzb42
         2ELw==
X-Forwarded-Encrypted: i=1; AJvYcCUBoLx5nPd1qWV8NPSoluMyQzONFCKQ2yq4lM/8ivXIgK123CkXN+Q+iAR/Bv5F/90Ms11kg14+00J2TwRq@lists.linux.dev
X-Gm-Message-State: AOJu0YznHAKaS68whfM9kYn3KIWJKQK6TNPjOBbxdQcTCpBOXQw1IIvX
	X2DuZuHJKRuSUWRVPhfZReIOkXI9d4uNMNK8/Ei5eav1z3SIa4gPNOD64AcRG68p
X-Gm-Gg: ATEYQzy4BhDE8Xdb9Gh544eO4jR/4gM/L5O51wq4x/I/fcYGquzhg8kBNTGGnyNzPni
	aNqG2jj1qlPqtGyBhCelSzu0vdhPFGEKhPpdLdnBfkNlxRMxGMp702ejhqWzTNabrFvN9aG0E0J
	WfmLiTZWVBeruCIXnTEybfRsIHf3ESS1i4oalQFhSgSohYIY7+ZoqcKOxE4vnmPvhM99TvVvUBc
	baKggNgxgjjoxRfBGQkSeUPgHh5mIOVpkMTgZeMN83ZF9kjABK6i2VyKOF6yzKj6HODH2aZIh5G
	bf4yvZ0AH3n9NYGSlrcXUTscHBVctRMq2E8i62Bxbuxtc9YiJURG09Ao3i5hwfjzjkzG7yEVx8/
	BMGKD0EcEFAX6D/tjTXRgfzlZOkjtuJhMpTQjMnzPIrl2S5Ra7QDMx59ku4iHb4rU0odC35aafk
	N/+wtW6eTeuRD4/xe51Ex1s7dmdxLWeJd64hmZqvkjooBWPChpTs5kzxJ+BtkFi7LjtL1gmagCS
	IifRlkNCwwny+EK18kXA3sdksQRwXrp
X-Received: by 2002:a05:690e:4090:b0:64a:d80f:5cf with SMTP id 956f58d0204a3-64e62f8fd9dmr8749130d50.25.1773538096867;
        Sat, 14 Mar 2026 18:28:16 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b39917sm3471100d50.13.2026.03.14.18.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 18:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 20:27:56 -0500
Message-Id: <DH2YS0DYKDTD.2AWOIWPE5N1MG@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v2] staging: rtl8723bs: replace rtl8192c_recv.h with
 rtl8723b_recv.h
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Azamat Rakhim" <azamatrakhim8@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260314190704.11945-1-azamatrakhim8@gmail.com>
In-Reply-To: <20260314190704.11945-1-azamatrakhim8@gmail.com>

On Sat Mar 14, 2026 at 2:07 PM CDT, Azamat Rakhim wrote:
> Move the used definitions into rtl8723b_recv.h and delete
> rtl8192c_recv.h.
>
> Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
