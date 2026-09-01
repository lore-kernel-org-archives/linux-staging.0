Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368A37A831
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301016; cv=pass; b=UOCG0e9TyTZ9C3KGMzdC2B3JX+K6TbFw+7Kuied0Zz+EaA0kq+JkQoZPdLLQ2SVk13boskDzwqTqK4nxnTZISBX5dCwodpTmjCCWkpGrTv0R9gPh0qCsjHLYz+YshNVRNe5ZRZ0OST+FlfwAn2Wt4U1BPu1QzKBQ/BYPBkvkkeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301016; c=relaxed/simple;
	bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9P6uRd9bh2fZD6fZ3HcUJksyCQ1Zx8KnUJZ5lz5BYVYQ503FcG15wl190NoesYtQHiJO1MC7EnrEf1iYg+YgzjSd8fHrrQls4mIfNgwrLA8MpkM3QQNyXCEhDVIx51IvU36Z9SB6Kn0raJQ4MF6IJxuT6EGMTRJQPskHGzKjAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrWOLItS; arc=pass smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrWOLItS"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-497e6956acfso312161b6e.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 15:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301014; cv=none;
        d=google.com; s=arc-20260327;
        b=l/OSEodGdbjEI2E5gK73QtSqzVIc9nZRDEQ6RGuYmr7WO4vTr8bJYd4yfWdwNSSHfT
         e1cG3spVPi+E28nFhTjBxwoJCpQAT617UJx03bcCA0l1nQkrKGs0RNxFdfhrHrsv1Xrl
         zogGRKW5OSY8ewVotnIxG+O8TNkX7CMRsWvTDh6Y7pz1f3H7X6RcqiGhjWf2VXmON+i7
         wluKNoIMbZ2iqwbFdmiNZvw4I0jqI+A22yKQQRG09nLLSs4uCcbrHoU7tVKJWG7Ph5mm
         BwzcbhvdsAxpsysdkgQEv/E9Eu9RFTab53cikDEOk08myTwAEdW8kso6kcRRI7ze19rS
         +dsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        fh=jPeVtioqQLo7x7A7vxiKW+73tesLNV2L7Xq3UfaHf38=;
        b=DWgPXRGOKOkYKwulO6JwnWhv5fCa0gx0e0nWpeFmt8AvfCMAMWLNUPm2Fqtvgg179M
         XRR/7RLpp/xCIUvbVzseZhTSJSieaLTSJGVGDRlMXmLrt/bOTwK31je55PUYJH8R8qVo
         2rMabIsEveo7MDnEOEshGi62HidHz+zxRtTGRGd+/6VJJYKiZsjMbsbv4wgZ4vKwg4XU
         jDd8lZUL7r02WViVLpNJRev8uiIhAN9G45DzxSJwcQbQMuVk5dXINNPv/VK76ZoOCJWh
         5kt3JF9GzPhF2qbVMhDFNWwpOwlEkicranyVNssAYtfgbqqMTiUI52Dbut6828NVvR9s
         IbUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301014; x=1788905814; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        b=NrWOLItSitGZ5uDXg0/KD453tXQmzxoNUSqGN4RPInZPB/D8x1j7z5gdPD4Cd+09Xb
         mSxKPnwPPGtw5FqqWmQr8/xl7LaNNcW5ZLFAku8EiMAB0MmN4Oyc1k11lhk4FKAs7DIN
         pqRkIHC9MifeMxfQMwy2xPztbmRUp73z44KYMUiUljpwNVCFrCr7a6P4uQb4S+ltO1WC
         HqtDpt0G+qhL36Y15HP2mMiyhKBpX0tFxemIIYPsqRugCJC7QVzDcplIMqtSqvPBHeMh
         Xvq3cEHTmofoYjMH5IWSLK7VY/8k9v3XLJghWdzFm2E5aWjSkD2j4uiSGk6g2UEXjyBz
         buxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301014; x=1788905814;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p22kh6WEGbuKfAaoqIlc3KXEj52IPkMy1G0NBe08JXg=;
        b=T+3pcG1FMHhprMsD9ZHUhCsEQNPzUTDFIFZ8B8OASGGGRu0cW5sjVEIXMBumpt+4y2
         hXVskUvlpG8UYGARRKbgXynKoWSCVAOMji7iAdS2wXZFRhEtTjS0rJaom7n+GChaMd/v
         DUZuXfrSdL+K9XCZs3VH9kWhDXKDwZ152vgQRtaVsN/Vp5zO7dD/aEfYHsZ5eokocnki
         RtxMak405U2CS123d3aYicldfdJkl0BXMtG/cmlrOzTqzVeTpb8uhrJScEDUPkJ0fEoQ
         CdGuCr9dDLGq1rqiVdmCdaw7aEkclZxqsXx3w8UarKs1zOpMw2ezxk/Z3Gr128ZZdqTp
         U8Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrJikn5EB2UPga+76nrNrmxj7Yzr4VryXhkDnGg2/a0glE1azAWZShwpkUqLpucU+yuziwIxXdRbCVgGdPX@lists.linux.dev
X-Gm-Message-State: AFuF++lP50kdclWKjEogsA0WVpt0WUa7QZ4FjcTZReAoN/y9iKJh6xWy
	uW2RhNEIb9/AKtZYG2JtqL8K+6Ytkum8xaKUiSwuOEBlbltYtfHOkPcfOWoTFolBo/wvTQoIuFE
	OsxsF2uZkdnd+mrtW8ymZEs7wlVq1f3c=
X-Gm-Gg: AR+sD13Gw4uHw2sHmAojIs2KUPec9WSDVmL+x2nSx2zltQgc2gO2gc35lKq1hrRuVIU
	Bxv2gce47yTZNTWF8eK64vRbGsnTrR6zpYhXxPSGczdQz9BIJfpVYAMxEtMVWzGtLtQnyVcqVzx
	PKbs0MsrlD6Wy1/1e/GnPwLJ7PAS198+0JgaiENvFFlOIwka9E8fYBrJxAWCC3jrqcGC6Nmy/sx
	p6JN4T6PVl88lJd7ddWoXK1sjfXko8OMSpm8fRDLhJiNrjqxDInoyjbwBPyWC5aL3KuhUAsSt4b
	YOFGPN1LZM1DN8yMK1z5NAq5Ho3iLwIvukwN0my/+dd1O3Mpu2fQWuBvN11xhiYWthjoC+GQh2N
	mKp1BwZLgn6ljoxF0EQR87ME=
X-Received: by 2002:a05:6808:2205:b0:4b2:8dbf:ffd with SMTP id
 5614622812f47-4b5bed07aa5mr6265199b6e.1.1788301014213; Tue, 01 Sep 2026
 15:16:54 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:16:53 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:16:53 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:16:53 -0700
X-Gm-Features: AcwNN1WUFQ7ilhOL96JVJxn4tbEarARgcqQdd-VycQ42yfsNYLKxJGesXAWGlpk
Message-ID: <CAO7O_xifSM=Ev8WtrEyufQCD2XjgtimwpzuwJDZC+d_ExbqmzA@mail.gmail.com>
Subject: Re: [PATCH v6 01/16] media: ov8858: Extract digital gain programming
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@amd.com, 
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net, andy@kernel.org, 
	andriy.shevchenko@intel.com, hansg@kernel.org, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch is unchanged from v5 and I accidentally omitted the review
tag provided by Andy:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

The review was posted at:
https://lore.kernel.org/linux-media/apa3EgKdnBfKXV1m@ashevche-desk.local/

Please retain the tag when applying this patch or carrying it into a
subsequent revision.

With Best Regards,
Maurizio Casciano
