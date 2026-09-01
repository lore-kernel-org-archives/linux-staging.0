Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAAD4746AB
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301030; cv=pass; b=CjiyDn2oyt/a88BILXQ0eiWSo8EsNX47caM+sY+IWlWEJhf4mrYhJbcBepQWzBeBXnqxRzCdzTy6sWCVMnBhpoSm1lqwKvHguuA7yzWjwlcmMkFhBfO7Ewat8d6266AOj6v/8ZB5lsDrFMcIu3Q7rA3qJipG9dEFD0em3ovnvCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301030; c=relaxed/simple;
	bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWmX4hv61fXLTQLvQfQ3uZVhP4gfgcaiyrzO5tNcPLxC2RnK0icUxVlErKjb01rQ1AVWTthazqEhUaQJHYTx5eiyt/o9KE1kfNMbIKXFFtKLdwq+RWXGX+CBczb+HdOVGWZiYE5Mh53b6WMYANlWX8szBQMSsNX7Rq2wnx3cjPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atwlSVzK; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atwlSVzK"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b145a9623fso178581eaf.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 15:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301028; cv=none;
        d=google.com; s=arc-20260327;
        b=k3ZVnZWhYDczUbVW3+qu3sT+F0NoMuwaFXJemjSQvfE+29Q5FPm8z6328CJJSUMc4X
         7Jo+af62mamLE2RYDLISLqNRSaw09qprhuvJXs8tyWHT9JfKMcVixROnxSL1oK4JB7dH
         u9TdI/bNddOD4oy2Z0nDlXF67Dtg11PmF0Ri0sjQrJONLcg9F8pwGvmbc1VrTooBjnpn
         xNLVgr4KGlR9Z57RdMnuiw0AEkjpnbqLzA3Afecgi9VhgUetATdnWkjTEThYkJssqkak
         mBksSSYmLdB1s0InUf4mcOFEEPxKR/DVinf4E2pcfBoNTO0nK4I7hWs/S8NhWmDuwBTn
         95Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        fh=gqnd7NEgSFtZg/sqBThwjj6FmnQfNNUXZxw1bHr9w7k=;
        b=jmim6UpLm44/RhTrCHHCgSv7XsdhSXzDUWQhQZKzGGKqCwGOoc1aheHlIpTOJQsp+5
         dDln/Q2bqi4hk/nabF+aD4Gz1Pw54rNDdIz7OVbQKzq60Op50k1OEphmnB5dhtpNauyo
         Vj4569oasP/+eW4SNBV1SU0hwACaJ4ADyF6VJea9pXNNyV3zBiAkZnJKbkV1xrGE0lkm
         5Vo2j/r0jxwt9wtZJYDtHIfFMuVYurzHVJyTiZuuQpzozgmnXuok0lHEuLbjxvIPNiuI
         PVeKkytgRC1QCT42OWmv5lT1NfGfk6KurIx4CnTxX/vnUOHUbkIHR468Ee8Aq2/fCxl4
         ZkhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301028; x=1788905828; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        b=atwlSVzKOpd3x7X0kC1ATYXECKP3jJri3wQxDNn0mnmVCfXXB+TrjqBs5mAyEFCX18
         dd3Bx8moEm3XDRxW+x5juCe2pPFAhYHmNynlLageI1MGdSDY0CdC7XkELhtSXlxLXRdi
         IddLL3TrGsFVQOG1zBssEieaE4DQOfuX8VPkM8PaNgx1lMy9XjnMk3w6Dp/d2eIAeJL5
         URVRK03925/4Sim6qPknAfUqs9QZcMR9RJkEQsOOqvYD1qJUY1on+FibLvW54TNpIEPE
         0T6EqH7bqxW2DOI7tH6v2ma9TWAtXSxnSeE5e0IygA2HPv1hY+a3ihWaIuvTTaCnq2jV
         epsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301028; x=1788905828;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qjmeS/MczdbJwGmUSoNl6XtnQGI+9fW5S7nHgFZuS5w=;
        b=eQuSstrwnxV7jXiQq4HXAzfjA+bp3iO2TDyxXJKeSIk3FRiI4HTrtYj237w2ajJWNr
         DHrCNd9dbdlEQMGTwqRXqhZxHEyGAd9gklABthI+G5VWEtxup5sNX4LrQlfPmEJH2C8Y
         UAPpnXILB1JIr3LPuhw5x84KxefsQeiSj6uGI8SzHFIl/coedduUxam3TXhG/lDcR097
         xp2B8orO7lEwm5ebfAsBpQRU+uy7/sJK8DW0rd3rR2gMfWJhOf8NtQxEEpLELcAjIhgF
         moEKQjcq39iYRa49frEm0+U+WFHt1mdBxi1yomA3pA3dGdluImURZ68xXfOcUOLbvacr
         SDrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlIwIf8WIuNSkFSXbXxWxhbJrc9GcV2QNoxk5vqeuHUqpRmCLTJetTbNeZubulemXwFNOg2n2b2hKDEWVE@lists.linux.dev
X-Gm-Message-State: AFuF++kOUsG4M0Vd3qeVEZZL4nP+C4iIFCw7CHcHwuCXeh8E/Llkph1U
	vGml1dtRS7r9vjTCfGKb/NlHf3f0aufyi2pnETn0gCYIKJeTDCXS9ztxVyMxGCbyeEDZaL2Cwhh
	6DaRf4OnLBajtR7/86llItLlFx706b2E=
X-Gm-Gg: AR+sD13cYyqBf1Fj0yihCY6500wvp2XTni1UmubNuT7t00HBoRKWe5E68JRb+mBT2fI
	Tuf09DjZcLV0cz3V38uhfz5pY4qgZ+B2mHT5G/dqAqEt7m4FXi7ZVajFlW/7WCl1BUh7mjdNpCQ
	LCTFlwmSRuZ5lMcc6HiWdGctqXGdEGn62VRnPGL9zfDA2q0AIzUehmDck63/Vf3+VgjBsKOTcJn
	2qK9LeCLrypZlQ6VlpxMOpdRagHeIv2yfav7NTYBW6z/jQgAFsA9fvi0qmELDr1lnS1zkz1WowO
	FwLVhVTIPXcwCSt58l2DBIu5BH3JoVOLJ0J3xbnro4PVaghDCtVd2GnyhmhkFndGSppaZhHsG5Z
	BFeGjyYYaANrWPpU7AE5RhEs4ivMdvvztBg==
X-Received: by 2002:a05:6820:81f:b0:6b1:c841:f8e1 with SMTP id
 006d021491bc7-6b47f821075mr33519eaf.14.1788301027765; Tue, 01 Sep 2026
 15:17:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:17:07 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:17:07 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <848348bb4f153d165e8c47673c62464133fdaf99.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:17:07 -0700
X-Gm-Features: AcwNN1WBWcn3HnRXXLiiP_T9xHyJKMVOYheIUX-IeYxc7McY8SDCUBfJPf_I32s
Message-ID: <CAO7O_xhD+i6X3YSOPHB9NQUBpfmvg-2JAVojkzVO7Zstnu8cHA@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] media: ov2740: Add OVTI2740 ACPI ID
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
https://lore.kernel.org/linux-media/apa0cOz4aXZrtHmC@ashevche-desk.local/

Please retain the tag when applying this patch or carrying it into a
subsequent revision.

With Best Regards,
Maurizio Casciano
