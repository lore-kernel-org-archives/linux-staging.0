Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BAB2F693B
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 00:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769819750; cv=none; b=mtvMjB6M+dyCnJmLKDra4DWtAxIsG108n7Ejsk9uLYJHq9fY5ipsA2b7EL3Vs4I4M27+1QBtep4OKQy5NmIgzdhfyTtJNi/Pb3WexK6yYFASOdKmFLwLTHYYlge+X93e+HuMVHqPm9j8bOIG/9jWfHOSvyZ1WZWrIjCrzEGk8Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769819750; c=relaxed/simple;
	bh=vshrLvV91S+zrl6td2gzfaeTmwAFhDuKqDfF8rXkw8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=nU3G4LJcT+XtuHnPnkyHhPiUbIYUC9/wUcONXTWt30pzDTGAyZGr8ZuQyMCsXv4HqNaDQP1qaww2M/RFvp01YgL4lQ6d9G+tID5uAbGe4CDgICeIOSgvwlS+73rU6jlvl3UvZOGyOkcccPU87LloXebcVuta/P+H80IreaZypU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhL/srDg; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhL/srDg"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-649ae700ba0so866705d50.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 16:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769819748; x=1770424548; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/eT5/43Cj80ucaxjKfc2lWt8DTy9XJeYDLPtnm4SYk=;
        b=bhL/srDgmEpn7JZX8SERlXenZWa0/W7apcDR39+VRN2W6FGgHC3Huz3xQfZlyS838O
         lXsr/7nyTNTOU5L09fKrTpYVgvSR1Vfo1NwkaldAQF9ZnF4Mky4MYz9ysGB7vps7tVBf
         peQGWzpXCdfOSoS9WtVCy8jUqyWo/65EsDoHsqnQJkcNz9oV1JPtKbDs/D2d1O3mI35e
         4+XfZFlmp8SIvEdIvyub6V3w9W6c3bOySohH4ZN2n0fDRSRG1sX9mdpF52Ou23ACIiKL
         fY4WSahE94CCp9McBBKXAMPKgj29PxxOvD4MnBmXoqdC8m1vWVl5eXVqxfyYjWKIWdhs
         tdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769819748; x=1770424548;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d/eT5/43Cj80ucaxjKfc2lWt8DTy9XJeYDLPtnm4SYk=;
        b=D8xleCu/byrEn4DVoGa3vLxXtWH5i/yUaYO3hLrLdaB/R8VXVnvs3NTXmSMMpW0C0m
         JWz1w080JNI1oSA9oKAQF37RAT/YBgVwYr7JHh30nR0btEPNPilg3NFeTyIziqfliHve
         FebG+03zFjPZtsNg1mJxpve66ODpabG7Q5mVca8nxvHIcsv58guOd6qn5dbxPfDmK9vQ
         hViBWVTqg0H1PhZt/CBSe1p5LymCvQuOygcRDCQtQ8UUSfYnPA/rPpm6I8z9bPb7U6C+
         mbXGfVdra9RhxPuI57mwzbepjA15kr8fCA48CHknGtBK3RT+B784DlwmATKn3c9A1c4A
         4jkQ==
X-Gm-Message-State: AOJu0YwhVNV3p269ctuBpcRNt01LKfiJhkKhfWItAQyf6n2e75DbsXYD
	CqqcrQbqVoHiXomUctoRtokn/E5NFJDkyg4/Uzh/yHx8+n5MlHn6vTkt
X-Gm-Gg: AZuq6aLEgAmEIMB1pFdys7HhBsgyVKSryo94FZSgXcZL8UTBQuGy47izDKvRgYDPrTj
	tBHU+dQtVT+kNdK+eV3PloWgjGLblWwU1tV1tKvMBLGEYIcdQmucD3p68y5hV9pj/E4xgESp2N/
	t2leVEsp0mQ6ysNgm0R/o1AjIpoSM0Ck/ePWfFc7b+uPPqj4Hnaj2ouohhxdrro+W9Dr33GjQOg
	GC55ViqPFwMTGgOKomc/0mW1CkgjCViloBAqVKould+LGGN+0iK4D6W+GGVTOgwi8vS7zA1Ka6e
	bE6DZ/3sqnaNAjUP+WYUdaacNeFx6OHl9uIZ7LFGpDw0bhp+WMbcAZZ2mGcQiqXcRfNlgD18s3g
	KBBbcDB5pINtZHkZaYyGpcPekqYzAoA29/VNQBcPDQYjZYEQKILX0mRD4VgKOrsv9PUgafhZkyl
	XzQ6aDScyYq/Wqk9Z75Tw0RlXGA2rb9vk=
X-Received: by 2002:a05:690c:39b:b0:793:ac88:2a49 with SMTP id 00721157ae682-7949e060e19mr87497897b3.49.1769819748067;
        Fri, 30 Jan 2026 16:35:48 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7949be04d80sm18676747b3.34.2026.01.30.16.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 16:35:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 18:35:33 -0600
Message-Id: <DG2CQH8X0893.34H3EQWUNCSYM@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "SAJJA EASWAR SAI" <eshwarsajja20@gmail.com>,
 <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <iryuken@duck.com>, <kernel-janitors@vger.kernel.org>, "kernel test robot"
 <lkp@intel.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove hardcoded dead debug code
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260130172632.130898-1-eshwarsajja20@gmail.com>
In-Reply-To: <20260130172632.130898-1-eshwarsajja20@gmail.com>

On Fri Jan 30, 2026 at 11:26 AM CST, SAJJA EASWAR SAI wrote:
>  	default:
>  		break;
>  	}
> -	if (0) {
> -		int pp;
> -
> -		netdev_dbg(padapter->pnetdev, "pattrib->pktlen =3D %d =3D>", pattrib->=
pkt_len);
> -		for (pp =3D 0; pp < pattrib->pkt_len; pp++)
> -			pr_cont(" %02x ", pframe[pp]);
> -		pr_cont("\n");
> -	}
> -
>  	return _SUCCESS;
>  }

Please keep a blank line between the } and the return statement to
comply with kernel coding style.

ET
