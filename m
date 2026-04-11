Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA5C28CF5F
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 03:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775879788; cv=pass; b=dA1eu5N96PPuERSykZ/yz5ElX6dIyct4UemlvgvPR8B5wF+0h6lVTZ/CQsw3Ezi61dPLiYTuMSdfIcFCNbkrq0et1u7z4OObN7ITYQSjhiSBgrVS/CX1TnFfzp54j/OzbtqD1uyB7ZC5IxgZXIVpZiU1wOUwVfjfPy6gZ1UMMoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775879788; c=relaxed/simple;
	bh=KAtfpvMMeC7+NYhwWmxNj5lJ40aJDy00/mmDc0B48x0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRCNe17e2+meEY/WkmUZLOVchCVQ11fN5w4iSlZC3BWD3+nt92+s9FYWjc6ZmQEP7fBv7H2+tIp3RlzdH1B+wAbye7UVlhefjT75B1bJD9wM9JahpvKKYyNIMF/chiRmJmRThIrm44Dob6EKO56KmyV/3I6tDRhsgEu/zenGRkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaztyF0s; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaztyF0s"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79db5e18ac6so27448027b3.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 20:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775879785; cv=none;
        d=google.com; s=arc-20240605;
        b=QDsFF2lQe5owRfptIGLYbDT2+5taV/sGcMPOgHUAnzEGmAHZcVsPBEtnOhb4GnALsC
         HYe4TpGh1jSKlLXji+lYARg+/N+3iM15U033ohqgOy1S6A9KYR0ijcMBOefJxs8PT0aq
         wk5JwgtIIfHR921jIRNWwFG6ZFjVVKXGRP2eU90YUzcYkPPBpn3ehZpyXJT2G1gsewpN
         ESI4A5eXzviiiSequRcVF6WMmaLju4iQCgY2NTuOBrTTwmSIIAxC8iQO79/eVf51aHP4
         FD4yQiY5hsPonmfgcIhTYMyvdIAIv+vwBxifHHaTFGJ1AxiRzUq/dCgSBxBqwf6lcIK8
         xXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e1f5f+7zRTP1OOvfHpwJPcrInAStesOlM+p9HN+kdsM=;
        fh=h9/2GjpfHAoTW/M0g0EcmfAsUDx6lKsnZF71SAYWAt4=;
        b=D4ARzv+RZfX7P7X+btGxgtvZdGUtrbe52w3q4bwgpRMDEXyxCkrny6XTms6DtpcVr5
         kHo5d9HepyqWlBhRIhJOoPENe35VGsrIaPoBoQqIJJxnv6mD2jufLIRz3HqnSDFDtjE6
         quKz9N8IbiYdmWWe/wPdz7ayXm8DJJ0GLHC8d0npctzKW1RbeHSZol1AUCJttPsyIJEX
         cNmErwRHeSuRYA1o1ebBluXDMjHi9EZDxeh40dOJbJrpoT3tnYO74T/j0J2DnaJCQaXC
         JNNIQbDLdY6E4sNaGtBxmzcQ8rXv2g1ixmAjV4LIIrj5QFvGSQr75s9qfKbYDI5qggkZ
         ZLpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775879785; x=1776484585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1f5f+7zRTP1OOvfHpwJPcrInAStesOlM+p9HN+kdsM=;
        b=eaztyF0s1nW7cU1DWXN7+B109SK8GLSijDQLTM7C3NymEKaWtrpluBI9OKUbV9+058
         dp29PdrhCVk7fS0qoLgLONPm6KyJXo4R8lsWKatu3/3IKxx/HnlLQYR3tUz0CeGeCu6J
         p4R59zY9nQwGOcUDJrkdVKoJoH13/jZmBS+F5U63w/Bm9cclZJXW4moWxrCy5PAk4N76
         CqeNpy1caMUMpqX6ToOaI7fvDyvn80v8lAVECJnM8jW+4ehLVdVIqHJQEKGF47N6JXTa
         iQuIuu0r+vFPUOHS8pKh0qfRVU1hDaFqw58NupcYygFlzWV+dvxI0YTy4fQynaR+ifrX
         Fbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775879785; x=1776484585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1f5f+7zRTP1OOvfHpwJPcrInAStesOlM+p9HN+kdsM=;
        b=SRw9BTeMPppUyQjPBMzX3vjiUnfp6kx/ulYfXSyyFDbyYyG1L3Tmo5A9rxDHGMWwfH
         FBVkfHrStZhtMVdCtU6InVGl92n7B0JJ5CBPZJ3Lsd/mh5b5y0c0qotWcd+rIovIrvxU
         xLzWOwJBYJaLztug3QaKmN1YB/t/NhfKBOBUNiJ8nI+efmSHOYTlKVnR4wO/5bXEYykp
         afIwKvFibBu9Vi0IbKHvdP6VrTMiCDee9Cx/DD6XXL+XLMAg9cgs6TjPb1eQoWQBFDd9
         V6g7VxH0kMn7PfEdMGlwqj9hGmVyAgCVr9vlePAXONKkAz7dymvbbjyUa6HQrT8lRgDN
         WO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1tzAQlKhUnf2BYCavsICefVrA8YUSOHTZGGWjZ0pOxcyBNucb3XEtNKAVK3rUAxUPxKw4vVD5KfBE4KbR@lists.linux.dev
X-Gm-Message-State: AOJu0YwSqjUc5PBFFW/eNoldveG+R+eM7c7LfZ+igHJ/7PTvN2X4EIpz
	OKVoMKtYvHLz19i5uA3XvDatkxM+DSTyetVuWOuljd6sAQMMVEv4y6YMvXpcG+eKnjBBxw6CN2V
	cydk+0yf632KqNScLUkvn6gQoSkZCs5Y=
X-Gm-Gg: AeBDievLQbkFy0arjIyuIwbnMZBDmgFMzJxSxfPS5MvICAkamdgcfAstPuA/9IepIOr
	jE4NxLfSRaUJ+SPzVoVt7EQhqLPgb8bw0Egh48QnojbgiRQ+Nfzal4ATvZpIEPZtcuVcP2eWrel
	Y+RUpYLc7vwGlCFeyqn8TDnt+6+I3W1GV/4TbRYqZY/uzwwcC7Rd5r9Yg1tvb2MTLpJ916Iqewf
	ADKNr5b6hDfISkuPPW6MHPZQswfNQa4UMyZ1AYMhsNwYQl3xHFzWE3wRAJykT4MJx6IACImYhmh
	okC7
X-Received: by 2002:a05:690e:1c19:b0:650:1d03:4126 with SMTP id
 956f58d0204a3-65187109813mr7941917d50.2.1775879785042; Fri, 10 Apr 2026
 20:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260411020513.36108-1-m32285159@gmail.com>
In-Reply-To: <20260411020513.36108-1-m32285159@gmail.com>
From: Max <m32285159@gmail.com>
Date: Fri, 10 Apr 2026 22:56:13 -0500
X-Gm-Features: AQROBzCzScAYUXlPM98b_nVnV7o3Bgy_xYEnwYiUQopopC-fyuoD-Ww1WwGv4C8
Message-ID: <CAKqfh0Fex-33YEn-ZBsoFvSieOvEBzrfGkTKJGf6_aO2sq2jOw@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: vme_tsi148: added missing blank line
To: gregkh@linuxfoundation.org, akhilesh@ee.iitb.ac.in
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I just realized that this fix was already rejected last month, so
please ignore this patch.
Thanks,
Maxwell Doose


On Fri, Apr 10, 2026 at 9:05=E2=80=AFPM Maxwell Doose <m32285159@gmail.com>=
 wrote:
>
> This change resolves a "Missing a blank line after declarations" warning
> raised by checkpatch.pl in vme_tsi148.h.
>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
>  drivers/staging/vme_user/vme_tsi148.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_=
user/vme_tsi148.h
> index f73ac92320bb..3102b94a0a86 100644
> --- a/drivers/staging/vme_user/vme_tsi148.h
> +++ b/drivers/staging/vme_user/vme_tsi148.h
> @@ -34,6 +34,7 @@ struct tsi148_driver {
>         void __iomem *base;     /* Base Address of device registers */
>         wait_queue_head_t dma_queue[2];
>         wait_queue_head_t iack_queue;
> +
>         void (*lm_callback[4])(void *); /* Called in interrupt handler */
>         void *lm_data[4];
>         void *crcsr_kernel;
> --
> 2.53.0
>
