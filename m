Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18B311C27
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099045; cv=none; b=TkpEICQi7kW+uguSWSvlgk/VyEVCHhZKXB7o9H5/RDT6QErjc5eDemYqxrWYtTpzPETPaRUfydHtqn7sMaGmuWWGANIhtQ+JBYU6rp+zPKpXGVMnvO/YfGhoyygZDCERjwX+5LWQB17eHRhpt2msNGdsKlnJ1B+IX1Ljchl74Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099045; c=relaxed/simple;
	bh=dTiEp68Nfao/SpQBmGMJSfeeQthiAWmddt1eC6uiMVw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=brbtWCFdt70WpQDdspZt6uo9pgZpSTGFc82d6hSDROzLsbbz1C5OnA1ct7D+2WkZNfbbcYPOkOjfKvsjzt9+nK2kOit8hrCzewRM8t4HEqvOz9cQEeyEDyQDcJv0WsOT7y9WMl6X4Ujyg5YbqnBHBXoqRYzQ+uEDlNsoleU/Gyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8RjBkgN; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8RjBkgN"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79ab5fd969aso4389327b3.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 20:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775099043; x=1775703843; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTiEp68Nfao/SpQBmGMJSfeeQthiAWmddt1eC6uiMVw=;
        b=s8RjBkgNpNTcK9zqCS3Mknn5dQI7ThyQwpMN0FTDMdCN9VkhFdDdV/gn838yKSMxEy
         LJp1IfxHgBKUHDEAYAjv/IfrVXylnT2QAlbTlIqJAKVV4UU1zhywV/amd7Epqypu4o7E
         uMPLE0PkaSKgqmY5qvF0nx/VcNMaWwCn5mVQkfMjK5OSf7dad5uIfuJr3sdhurEd5vw0
         uyGWQ0hA3ZE6qp2ysNKXE974P2ZVRBNBnak75V+7v0QOuRAhjlEWUY1Td1k3XhVgA7nt
         id7+/HKM3cohwH8jSXRG2mzkgMgYKnzTCCXJNRi/nPaXmPh+Qp+59t6Ie3Dp5o86KQQ8
         IXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775099043; x=1775703843;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTiEp68Nfao/SpQBmGMJSfeeQthiAWmddt1eC6uiMVw=;
        b=KHTZURvFsU6muX7zOVb9ebwYkeEuogsxEQ4ttg82Cijmgp9c72vQPS4YzsraX1QYg8
         j3wRiUAlWbFTZj6AUIGTzwglsAREsL90KWau/IKl6FVoH5X3yG13E3qDEMws4XSXYQjv
         7LOOcy+TMGT0z/IympC4ESG/saiVM8hZ1QQU/aP/JlcbN3gpIl5AiuywXRszFDpmsVnE
         LrdponZfaYlrfTFjCtg4XdnmeBdeE7XeeTAu1v/bBrebNaXfjZni6k8HvdKD/wQXtqJ+
         6QwzVjL4UOHWp/axtPEIopi7QY+mDAcNADlyVwvI4I1pW76Q07feBp2t+B7FbXWKlP6M
         zc8g==
X-Gm-Message-State: AOJu0YwTy7ljSH/kpJCSL4x+GbRkaGW7Q64ze+Qe861N5RIFjHtnhDWU
	AjMUqCdsiEPtfS5yOHpmvjl8VFwJ5srX2j+3I1dZpXRsqpuC5SyVQO2+UGRGJVXJ
X-Gm-Gg: AeBDietSdnAURmoCqdkoEXSYgxETSNXFWlFUMTqbam+MfVKllsE7hhcWHArn8iHjuA3
	U24ICg2sDxpI5ZHiBvxR2szx2ENfrm/R+z6VRllcNFAjutr2vXFX5PxmQwUvlQGEIr9jWNhyrsC
	TC1xvmk3dC79byS3sZ7pGnQVPz0bYusNTDUAmKxBdnEKH41+fLy2GoZvWEkzvT8NVwwSTlRk5tS
	fORpiEvU1bRb4ZifSOc1XC5cot8osF+Dnq68/vcrYZyjMuatj486sP/ioSiPSgLEOauRgNT4RHF
	XH8yewg9r76RlpKxy4Xh+V2IzleaFQYQmi8E9icQCoctjYt9X5VIgVLWX1PKbCf2tn1eHGk/0V9
	vL06hD1wqMYEQsxU1egdjuFLoK1eCwufR1rjQFqSstSszgP7votB3ed3HEOXo6G8e+i42qJiHVz
	YttbRIlF9zp5/zrmqk7WCxlmCtm2IdIhl/XR6hdu8QP+ZPEDHcGCERBufL/Q4AfSLqBb10adp0M
	udVLHQzoaYcFsOBz7O/Y0Tc4pMeZvZU
X-Received: by 2002:a05:690c:3:b0:79b:d341:56f1 with SMTP id 00721157ae682-7a20c8a8261mr69963927b3.0.1775099043228;
        Wed, 01 Apr 2026 20:04:03 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42ff31sm5794007b3.6.2026.04.01.20.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 20:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 22:04:01 -0500
Message-Id: <DHIC3DSXGLGU.1MZCZ0J3392I0@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 6/7] staging: rtl8723bs: remove unused global
 functions
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260401190814.216333-1-linus.probert@gmail.com>
 <20260401190814.216333-7-linus.probert@gmail.com>
In-Reply-To: <20260401190814.216333-7-linus.probert@gmail.com>

On Wed Apr 1, 2026 at 2:08 PM CDT, Linus Probert wrote:
> Removes two unused functions Rtw_Hal_ReadMACAddrFromFile and
> Rtw_Hal_readPGDataFromConfigFile from rtw_efuse.h.
> The functions only existed in this header. No implementation or calls
> were present in the code.

Remove two unused function prototypes would be more accurate.

Thanks,

ET
