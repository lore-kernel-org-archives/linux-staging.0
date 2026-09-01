Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8963A544A
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301301; cv=pass; b=VhaPKM1TPCYyHMGBuS8OmS//oG9k1c+M7iTDsmEJx9mzyDhVf+Uw1jxlfFsNwdfsteEOxZELWg7GonYo1QRbVmP7dzV6iRR81HB14ls5BtH+lU+zdczG0tQJiPRmIZgTeqIUn2kaeKlEHIvztAtJpqpmujTXx9NawkaV0bzdufY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301301; c=relaxed/simple;
	bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Muk2EPnvfnf2tlDd+Uxug+xrMd3qSrLvWxMAstbyzWQmFam77mdh5Ij4AicyNRkWlRDRAnR9CdwNBdPu2M8YcKQyJqx2cU+DjMZucvgj+nFwwsiFmAzdKl52CngSIY/tlnufdaO0eOKmvTU/BNahjt9VN8gYN1/B88xrSGSkcDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRmYY0B9; arc=pass smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRmYY0B9"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7ec1e9d3359so244686a34.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 15:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301299; cv=none;
        d=google.com; s=arc-20260327;
        b=MFkp68A3XKQpC8OHuZ61L32QsDYiwxvqHc3Ii4kOdexlUf9nBaluM8K1BP0GbSrSR1
         oZgKhR7PoNPEix+WrxKLmY8Gx6LH7Fl90uYVTNyfO+SUNERVAl4GmChkOzobjpEedlS4
         99/o7Jlt2V+t3Lm++Q1GXlnbtvUgBySS4PkXyIuPzWiNSun5vW9Coii3d3Kh1CCXa8N2
         YYTW/4ACyg6i165a+YDq/Cbb5l4r++i/7MOR7G+TeTxU6Gx2rVg2xqT/YOJHo/ZCVeJp
         pyL5WBhG/twAaY/ZJBghXONM3ArZn9+WizB2KkfPZ4FOeq8KcNpJ9qZ+lxLUHa9EqahG
         f+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        fh=CxdjLcLrWM6SzR1E3ZD/hffAxRnQl/5PoJcrOMT1ACw=;
        b=C66Mh9rtpLHbVk277TT0TMgi++7EJKodOc+Azm6jzGRC/vOnkmV2e3532RuG9z5ehF
         N0l0C6Vp66YFqkV/S3NjXjbLvkZx+aGdo1QpWs961Mf6/Gm6bPIVCP13HycJWGOAM1Uq
         RfiBuxOwnP4CEBYWKo3Ljb2op0G98jLWH4h27hNF42xo1CdpAfnPtIGz6SmovK94JHXa
         AfxQaZybV+k9OYRxC5LX1Bti0kQ15DRJBLJe7lAGk2r04KAFNhyYNgN8i5QjTrPGS/ds
         UTur7O91/or2FJktvqDy98CW61rOX/1TRyBac2jWYnA14V+wdey4eYovds/nvsNOLa7f
         dvTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301299; x=1788906099; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        b=kRmYY0B9qscfVvSJnJv1QfzKnuePkYvOwY+OwziN4RF2sKXWfJs126gJIT48HmCYV5
         bK0EWWpJoACFDUtv8zjqKbcWnJPEKUervCsfrN+ga7U8Qzl67CvYwM1yD8IohRP7uKZk
         FZxBJ+mfHYpJNNEVd++3Qih9dHQ2r5rtn2T5fzCQLcfSxMr7M/lrGsshW7Pzf3rjjl4q
         TcbRFlhQ28d9ffLdSNYPo1V/Njnp7oL8Q4u5SrETLgrw0NaHDtEgZewuLFOzVfzjHtBJ
         RX1zrMVT8gAnCBA1EyGM+PDoX7NJ/RsMATzzR+/YG8v/SaWJ+heF1C5CDHrCd14Z+o10
         7sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301299; x=1788906099;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        b=ZsvW+yfUj7LsbrRsVGSE4ecQ80Oea2QfY6kDrfiGYWggmeQkbMYkSA5FuFfse+Ll3Z
         D3jUQaO5AfCRB01mJepUXs5aXmySZQa5YtVees9wL74CfcMHQHQyaVni4oOIKL+gxUtY
         vGjpThTet5U12eZFAbgTX2shoxwsXJLVswZK7iXSVRF/1nF8BKRxorCRVQrTXmIG3Zom
         WYjtDTTzQ1mngCYzHj0lVbcHN7ST8DcVuFmBYciPwyeqPhbzxQvRQwV7rJFY5GWAnjbQ
         EcZB/7SQf2G4OJ5OeGQZ664NheGGnCrhvXs/gVhqiqeLMJLlxZxtVcpMDqeRtnGtlBmF
         lLXA==
X-Forwarded-Encrypted: i=1; AHgh+RonTs4NGx+fJyyKnzaAKCmEkB/qCojba4AiyQIr5fVXi1qkeVdH1T7A18AysUO6MtlRpw9tNpHIqmpsDOER@lists.linux.dev
X-Gm-Message-State: AFuF++nl+D5+xvQzSS3r4+O2sotXJEnFY61z8y/o79PuUduH35IRRPGQ
	l4e4vJuGmQ7E887u+Ea5245lXae1IZ7Mj5CtkSxQxxNkzzqJzyPqh6rQ5YAxAgw22oMPc4x16To
	gIkIThtBaEcmMIM2u2Nh05jMUSNZ2ZGQ=
X-Gm-Gg: AR+sD13V+/RtKE9JZz64Idwus0KqnDfYhjqXEO5iAh8f0Bc+AsKA27XAk4CIiqVkTv1
	1Ys+M4Os7ccdrdhtOS2aufm3YCQKuXKaVChhlvd0DWtCEEpfSrn+D5HM3SYnUwXBKmlVzlmrGwY
	rNtSOsJTb0hQi80WLDWvcdr+xOFLeStaPR89ASjv9Hb7GffLeMMISfFj8pXLCI9xUSiuQQwikZw
	yAJPbOs5wvHZINtZejKo5o4FARk97+kpwW+/qOjx2N9MKyardo2PQi3bv1v5KjOcNscknHserx1
	X0gwNdue48K0qtaFi07jy+2Xz/YVOIJER8HxbhOqGcK1yuM01p7LInUkL1h0nycEMacXjqo4hSR
	LoZRriMjP+lYB442mL8qTADU=
X-Received: by 2002:a05:6820:1c95:b0:6b1:7251:41d5 with SMTP id
 006d021491bc7-6b47e9b10b5mr78023eaf.3.1788301298588; Tue, 01 Sep 2026
 15:21:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:21:38 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:21:38 -0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <932eafc6726b4e5d062a0166dc4b5e1594025fd1.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <932eafc6726b4e5d062a0166dc4b5e1594025fd1.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:21:38 -0700
X-Gm-Features: AcwNN1VeCPBM8HQqPnfBAdek2MH5-OmaaKJ-LDFTDljCuYh5s49MMUrA1HfUgKw
Message-ID: <CAO7O_xjyMujSdFsj6JZL3hYhaz-1fJueJ9gVV7-Y268jZeZT0Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/16] media: intel: ipu-bridge: allow sensor-specific
 link frequencies
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

Andy provided the tag with the caveat that this approach still needs
to be confirmed as the right one. The review was posted at:
https://lore.kernel.org/linux-media/apa2u8qJm6IZ5N4X@ashevche-desk.local/

Please retain both the tag and its review context when applying this
patch or carrying it into a subsequent revision.

With Best Regards,
Maurizio Casciano
