Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C337844604E
	for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128883; cv=none; b=PwMWaQoVEz+47IqMjfZZddiKQx6C1kMQk4TAxNQsXeCI6gM6oTAIybbXtPZkSkUOAhtIQoOZaUVC1Up73xKuVu3tiXISVjmr9RjM9wdnN1pNUtqkixiF3+8FhvmZiNH6VyZ59GQEcz4Vdb3veZQMcpSt93x6f6MFRs+51zVnGUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128883; c=relaxed/simple;
	bh=A0UudHQ9g83Wm57rKo2f+BNjYF2MbrMRmJA6qp13Uuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pu1JDy9PAKypUaonRXnpdr0xJEUSHNYM0zGjVdXLsVCGzsqjsqG86o3gxou+AMyCRfm5paBWWe4v49l+l7ejabx0pXpRFr2Hs3QiCLY7yM0P6jaTjTlpk3xAlN7eAv5tYzu32tbG2Kq+Brn5W8CbU+OWh+q2RkZ2ysEVGi7ZoQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaIlPvEn; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaIlPvEn"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso603844f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 11 Sep 2026 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128877; x=1789733677; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFEgQptOfK2+BAsw9MPq5NVIYztFKbDcTNgt/rynjfE=;
        b=SaIlPvEnkADItHxUbX45vWjLL5wByL/y8kNrWs1C1jgji02YIPi1UEOHsnTfhIbJqo
         X6zgyFrnEgjC2M0J1NyIQ8qZtlr23YHhQx+VHcZluzajFQdtWbBagJTs7boMii7dxICs
         tEEpVDdmBF+VgK3xSRhA43RAaOEBt272fu2N121pEQ548GstvtKMv0B9ynocoXzRRYRp
         H8DSR/v5lx8K1G18vhZrNRrHlXUcJHWqviplhgNX4dgkzHcqhxYHP5rSaaY5JlvsDFtW
         h2EkYI7NxzZlicaGG4DEoN9tgPjnAf4xtlq1JMQVozzbBS3eiUY+i3QJ/mPvVkLlO1yi
         qFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128877; x=1789733677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFEgQptOfK2+BAsw9MPq5NVIYztFKbDcTNgt/rynjfE=;
        b=fm7wMdrtWp2iz5EmqHqI1m37a7G7Yt4iIjMAv3J8JqqmsygPDDP2rJ4bfZBpb/mhCm
         CWSipBJKDUUhh5r3nn/cJIATUa3J7zJ6C3P13w0eFMQAE8P4rrcsr4WszQow1MotLu2d
         x5lTbk0t21NF6TTd7mXg6EX0EQPUdafczr+JkEXO0cnbecnHopUVXrZmHx2nkGzlfpjy
         Dv4VirHZNMyRRK7L31M8q30cN6K2suMgJYHuSoKOmCQGlqG9bDqb1Hh3IpyvFxywbAra
         Fk5DyPYP5/pykCLC9NDByiOMqfs5/9TpHbE5LcbwGvv9BjOk6kEVjmr2wvYcqn3X8Pzu
         ht2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwB/NjDhl6wxvZfsH7EAGVv+ag8bd0Rff/ottDeOdZbn5bdItc7j4F8NswUreHtit8auoh/91ubTTIAGlUc@lists.linux.dev
X-Gm-Message-State: AFuF++n5ml7LcnRMpBd+RFUm4DcNtGtBC8X74g7l7l4GyrMDfRPSEYEv
	0uaaHlbdjHomuMeM8dxErRYTvLb0sVvBcG5zS5ag12EWsS3Bpz6FBPR/
X-Gm-Gg: AYBFou21CRunAoylXPVVUoIvDC7lzLfFYezUCB8vDXVkvaMT2SyPB/EggBXpa4mXaUf
	HXfBAvs8fnOklgRm8+/2G9DhEvInDfYRTFNoP+PIgG3tpWsC32mXVdVeImFJhspJTq1oCdTSqkM
	Lc4PKu3cNCJpM5KOty8mw6/w/gPI9dEKuzyyO6PBsiWJes+FZvdiTbSF/QYYLL7bpuo854kbLzE
	gq8NTcDDqiBTGQTqqhY+2xOdeyyd1HNJbcxSTYvrFFUWFX/VUSHhMcM6bKc1f1uVyXecyLS9aE1
	EEwDtkZHFgZitwvePD6gOEj+mQMnIDBxDbzFFSIlhPxAfKicMLNuVF6J0Y/QyhISCTjiwxuwI/g
	SeMNuL3+mbNha0kqeMpMBZvtv10rBe/yOY2oTs5jiR5WBxGRTPWdszpgIicqh15rs0zHm0aMpsd
	M6oE7OoDZQ8UPtilQVKcHSE7gK244lZxQbfT4Tqbu/ueH3E7QFSL8TyPrOm9E/+gzd7mKRaXSox
	Nm9dA==
X-Received: by 2002:adf:f9d2:0:b0:486:e6a2:2d7c with SMTP id ffacd0b85a97d-486eb31b1ccmr6917106f8f.15.1789128876620;
        Fri, 11 Sep 2026 05:14:36 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm4982620f8f.35.2026.09.11.05.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:14:35 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:14:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Farhad Alemi <farhad.alemi@berkeley.edu>, Alex Elder <elder@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	falemi@asu.edu, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix off-by-one in SET_REPORT
 allocation
Message-ID: <aqPwqFu0eFY4CSZ0@stanley.mountain>
References: <CA+0ovCirfyOhrXdxmM3ri9-cShD0mzPptO1qtsaboS1xscaM0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovCirfyOhrXdxmM3ri9-cShD0mzPptO1qtsaboS1xscaM0Q@mail.gmail.com>

Alex, Greg isn't accepting AI patches for emulated devices.  Is this
something you could approve?

On Thu, Sep 10, 2026 at 09:32:47PM +0000, Farhad Alemi wrote:
> gb_hid_set_report() sizes its request payload as sizeof(*request) + len -
> 1, but report[] in struct gb_hid_set_report_request is a flexible array
> member that sizeof() already excludes.

I can't really understand this sentence.  What is excluded?

> The buffer is therefore one byte too
> small, so memcpy(request->report, buf, len) writes one byte past its end,
> which KASAN reports as a slab-out-of-bounds write. Drop the stray - 1 so
> the allocation covers the whole report.

I think a better commit message is.

  This "sizeof(*request) + len - 1" calculation is wrong.  It's unclear
  where the "- 1" comes from.  Perhaps the request->report[] started as
  a one element array before the driver was published?  That is something
  that people used to do. Regardless, when we do the memcpy(),

  memcpy(request->report, buf, len);

  Then it will write one byte past the end of the buffer.

> 
> Closes: https://lore.kernel.org/all/CA+0ovCgLrz4WhPKP5LGW5HZa8VOodgeo6pWuyQGgHE7UY57Oog@mail.gmail.com/
> Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>

This needs a Fixes tag.

Fixes: 96eab779e198 ("greybus: hid: add HID class driver")

> ---
> The device was emulated.
> 
> --- a/drivers/staging/greybus/hid.c
> +++ b/drivers/staging/greybus/hid.c
> @@ -97,7 +97,8 @@ static int gb_hid_set_report(struct gb_hid *ghid, u8
> report_type, u8 report_id,

The patch is corrupt and doesn't apply.  Read the first couple paragraphs
of Documentation/process/email-clients.rst

>  {
>  	struct gb_hid_set_report_request *request;
>  	struct gb_operation *operation;
> -	int ret, size = sizeof(*request) + len - 1;
> +	/* report[] is a flexible array, so sizeof() already excludes it. */

AI always adds these pointless comments.  Only interesting lines of
code need comments.  Imagine if every line of the kernel had comments.
It would eventually turn into something like the Terms and Conditions
where it would take more than a human lifetime to read all the things
we agree to.  We need to create an AGENTS.md which tells AI this stuff.

regards,
dan carpenter

> +	int ret, size = sizeof(*request) + len;
> 
>  	ret = gb_pm_runtime_get_sync(ghid->bundle);
>  	if (ret)
