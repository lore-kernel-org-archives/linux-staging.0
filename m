Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC140C5DD
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824882; cv=none; b=SiKwasIHUiqhceLQKRBXpagS67uLAWMSS9zpr5u9+mmukziN5/Oqlkw5WhQ95+yXaKkqOrjB/lVyIbqjMFA1S7w/u8WD9urwxugH2+UTcwcUquqSuoEnLv9KUTWKu5RGsIKFkV8pQjK5jM2n01ua2kWDfLRQ3M6o4vDAkc1Bpqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824882; c=relaxed/simple;
	bh=4wOd2k152jTIOetiUg0ErEuJIr/fWu9qeCXQaQH6IxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crLzgpRD6qqAfNRCMP8QduYW6P32kKWpvM9pO1e3YW5U7kVaskvFOpAc2CWOgEW2MsdUPSt9H3n88HhkJ0jUlQK2NQEMYJhsq/Yf6uRcq7q/XGyNtv6hBwU1IQBWcEW3s/13OVasGveCam3jJEVfUmt4XQw6esHz9GLju/2QVJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rZHoDQOJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rZHoDQOJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so36631155e9.2
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 06:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782824879; x=1783429679; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O7k0RIXCnKG2vJKuj87RS0STkl6Fhwg5MbkP32JPXo=;
        b=rZHoDQOJW1fkzyLYqlODI8+RfItIH5k8xwCKkUsspKftj7SsJAQLEuIoWxcTlQRlGG
         zEvcVAVBJq8c4waYj6xFtocV6dvl4B629vJCjJW5a4JCpZVeGDmrsa5LWOSOJYMFnX3q
         lZICNCHMHj9/HCyUwevborijiWxGxnt5MI7+vT07/OhOzQv/3lg8VtRgKEByJGKbMniW
         owDuXGN9EhpSttrR4m4zKuLxf6eG0aB4D2MnkXT+Xyi4JvLfgGYuLdt4bYoYjXQdixl3
         scILNF9zrXV4dCLDiy8OAbGafRXHsMH4JlfrY/B3fEesBf/WQ2VpTrLA9x3750G1/+ZN
         9R0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824879; x=1783429679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+O7k0RIXCnKG2vJKuj87RS0STkl6Fhwg5MbkP32JPXo=;
        b=s1Bq82KuzgDsUiKBPcb2iyqI0m0zvz5/O7FCmzuhTjIEmr+CDrTBFdOrBptQr5Ye7t
         HMNcpxnlB71w/H3BLk2aTdssG6Zj0Q1lyoBD/wtvgf6y+g+aurUxMu8KOliFnhMZPU5v
         dymfzm+yyZvqswM+9ccp+1QKdq/I0GI48eGpiZV7U3NQp3PenI22gA5urYE13GunqRkj
         n5CGmaXtNQqXimVS38SNElsbw/A4YKUG+v11wRRtwniSuSpUnoOcezh/Gl+UcZMUs3Zf
         wQ1l58f7Uev2cJ+F1wM6wAsKWlJtj18XQIhU315x4joDb/kuwrfOZLkmUf4FtI1D4P1S
         dVCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+bPtNVBoDpYJfRFLGnyee+aRWUq4UvkIT58GsBJmjgkbPl/luQQ+EYNVU+Jaw8U63jePl+OP85xQHAuxh9@lists.linux.dev
X-Gm-Message-State: AOJu0YzEDfWqukqBk1Gc6dfa8OrNYSYB8EtaCAuLa4PG+KlWWVfhgCNp
	ajSeuV9IEirmnpeZqskyufik+uGTwbSL12yFQF0A+YkPmQdaclCibeqM
X-Gm-Gg: AfdE7cnlSTjiGAzYH2Di0qL1zcVGxaYrgZNWfOdyMFUmHaPGBeFAaiOCkibffOQsWtk
	eZxGi1FyEBlI0AccFPWH874ii0WoNW76z8va4BGSUEXIt8+CzUH8kxloVs8ZMg2P3hv75RWEof1
	J83B6UPwfHfStbwgz2z61Yyr2eOdsTA9OwJiss/l/BwOlLND5OhACOXnG4CD4Hyh+UmFMXSPhKU
	tN39BGY8X1eSgBzbDlvOZx9OPAYRSNRNy9G0JXV3ayoZ918vpiWV2JE+kKm6EKYhjXwVxO0Rgju
	H22hIStsFaN8SLCvBUxVtmySMmqxlpqfJD83xZfNNg2QU2werEaEWnBPRHQy87ZndPmbMwLG7nP
	gG66W48t46WJDpKclJGuzYNCN4McJceI8b4ndA8sfSm/Cdy6ZHl+BMLc98iS+KDDH5O0tA+JPV1
	OIpAN8dzKlmchtuGaLwsNSCab05PjYvCB/CxcsLqYA8HSnS8SGrN5ZSzPfJ9a2zNpQIfkwdrqOD
	tLlxHwotwISlKDceS/C/WQqMbzQuDU7etTrOoUaNOZd3Fqlkq9e/3H43HlSnwRYALPSrFzKXl3t
	sn2FWYTD09zUdlE0Ayu1lLjpTeRXOdw/Qc3KgNkTP+ZkQi37Ga292zA=
X-Received: by 2002:a05:600c:4e46:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493b82b9302mr50790605e9.26.1782824879199;
        Tue, 30 Jun 2026 06:07:59 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf65sm8381241f8f.21.2026.06.30.06.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:07:58 -0700 (PDT)
Date: Tue, 30 Jun 2026 15:07:55 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>, lars@metafoo.de,
 Michael.Hennerich@analog.com, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, gregkh@linuxfoundation.org,
 skhan@linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9832/ad9834: use div64_ul
 instead of do_div
Message-ID: <20260630150755.0000266f@gmail.com>
In-Reply-To: <akOwOpTIBFmSvquX@ashevche-desk.local>
References: <20260630032322.5805-1-raizudeen.kerneldev@gmail.com>
	<20260630093931.00006eca@gmail.com>
	<akOwOpTIBFmSvquX@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jun 2026 15:02:02 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> Since we are getting more "fixes" in the area, perhaps it's a time to add
> a comment in the code summarizing the mentioned discussion?
> 

Good idea. I'd also mention Coccinelle and its false positive in the comment
since patches trying to fix this always mention it (my attempt included).

-- 
Kind regards

CJD
