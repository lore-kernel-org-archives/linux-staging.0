Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D53B1D5CC9
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865876; cv=pass; b=lsxoeD8BSAyVqQxp/xltXjCM2wQJuHwPg8abIMSNc4S/Ub3PAkJbZmuV/zS/LmJNbKWpNrzqFbVuCWMI9TOgS++swcehiIqkkaMrnE7jHOPW4sjo219BUMlgilA7sFRlDp/IGW6dRR/b3Rm8ang9tDX11znzg8NqTcDl9wqSTwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865876; c=relaxed/simple;
	bh=ex9vqOXbHvIQTl0dym2oWCgxiNjtgpU9r/i4Tj432cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xv3D7S0T2SpOQdB5LAB+ZaBWo3gpP6vYyLMXB9sLyPValTmZ4fTE14ASI4B97lm0M6w8ZYWvfYVDiKBkhRNZs1ci90iCutUL8PIQu1o3UNzIH8JLGQZ00NxRwTxxI78pSufdhjzQVhqVRM/kPqXNRG3ziBr12vTfJJcQwwciLNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEtNMpFm; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEtNMpFm"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e2050feb1so342787466b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 07:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790865874; cv=none;
        d=google.com; s=arc-20260327;
        b=UQE9EoBPGI+C3cfDzl/lgwrhiSGJtl4KEWVwnfGE1gNhS506drZcjHMfsTc0WvPy+3
         81BvEqieQO2DfZTb+1szPrCX3Ause+dlueVGa8VwfQsvBD7AEAxCHVLKfUhrYqhM2ryP
         E137ruvgqM9Dbnjj3tmMIq9ZBeKD4F7PlH/BQ5QMWyk9AY8xb9aOLnTDluDk07rVfOmI
         QkHQ3uq4X2tz/BlNPSKdsOQ5ueeVLn6L3Nhweuyvnbm060pynRfee+QhcIWeBwk9qbKa
         DxWMHR3ep67S5NyeQF5HBRe/IpLq+YNr5DZtnp1BOrvRlTcpgigQI3huh6U3g2onmEo4
         2g5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ex9vqOXbHvIQTl0dym2oWCgxiNjtgpU9r/i4Tj432cg=;
        fh=wQgdQafrb39F45i5xaPOFv5QUsxdbfdEZR/mwxkh85M=;
        b=GfWVtF3TA3utTugvJWR0T8b+sg0t2nvwjVD3xHztD9t8muyvM8Ni/Fr4K/VRP+iO0r
         mPkMomAna4XxNCw56rjQ1kG5qq31dIdpjjTNIX3IZMMfd8USq5eTX2FNVN6SYD7+mu6x
         tqGcxtG88dlOMf2vdVZcLHSPAmPIOTxynBafgtRxJia19vL8+d7eC+qWqh0CRpQ+DGGH
         xiRYJwPwrDiHvq1DzWZv+iO35FVY6Stuu3oQk0tmdd3bFQlZe4mxFba61t8I9baXw7GQ
         insT6Xe7/h6DOlV3sPF/5s60tv6z/T1FNVaK7GD2lSXfii67lIXviwUctBtTE3tbQSmo
         NaEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865874; x=1791470674; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex9vqOXbHvIQTl0dym2oWCgxiNjtgpU9r/i4Tj432cg=;
        b=jEtNMpFmEejON0r43C4xeiJ5KpcQeHDWJziX7Xrd9hcNZa2O+tnRldYH+J49ntywpC
         VGhuiVgtJhgEYAdWFmF7kY65z1AaR4KWRCNJ7JZydw5Jqaud27EAunZ9+5t98ldhtuq5
         Cves2bvKELVKE1Yd3JW9VtlpFaJHK3NJFDde2Qt3tQu34qRmprng8zwRddgw7W6aWSJj
         HveLj2U0mLxa6vWSMq6wib9slumkqg5oVfx059rB3h/O6y06otas6wOafAPpERyVfq05
         1t6qF17ziSCqLBWbxE6FT7MRjnUU1mnN4j8Py8Fo0jZwH8rKts6/R8isQgmQGMPENio9
         emNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865874; x=1791470674;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ex9vqOXbHvIQTl0dym2oWCgxiNjtgpU9r/i4Tj432cg=;
        b=ZeJbTuNPG9bt+X/fDQxvAlCco/1JrJsr0Mmvaa0kQwlfpds4GwDwfGdntCG08fb39K
         Uuq78QfQVv8ma8zC/pg10trHb6SoRmnn8mmN/dQfWq147E2Gfd+ePL9WQitQxnAae7CX
         8kUJ6oWY0JwBMdR7dlmKaMEZbwfzel+4G3QA+Yf1uf27JySfsGdSdJdGgiUgMGI9s1A1
         IrDqUsd+zK5ADJHS5fUkbQYotML/nPyc7XwpOxYTLTjuWTFmAoyFIC2Z5P+Grp7cT6my
         G2vOMFxwDlVcDWuZbOwEA8o60tDZ7/8/YwV3gUrg7OiagneXUHNkcsYn104ePaRl4Gj1
         ApRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnJngkWKt1jxm2r1cNXxByr51b126GtS16d/vuf8RRMutVmOD6rilTsJP4/BkYy/Q8QaXOZU3TR6TYiA/G@lists.linux.dev
X-Gm-Message-State: AFuF++nVqt739qZalvfOq2JnvxHvJIbbva78/vX4EKSfQSK0xozRyUbU
	LHwK+x6/n9o6//9BXwtZKzs2gTtQcxXDAvqMv9jIGGRE/nLAuIntzEyUvd5i3SJeMAf3Adhhuxl
	EQLoywoSIroORE8zz5orHYPHKjzqbRg4=
X-Gm-Gg: AYBFou1cOYhemfwicx8cMLADVNCxut3uv3s39tqU8CTnBAGNmsAt9OzuKBU9m9h67B6
	tlO3Gy1lQXifw1vg5sxKtKOL2YF+qE6nW/9eSbPz5v5OfR48suTAD46AqqGCAHPXjO4ii/7sncE
	HBgIhcHRDwbJ0o8xpF/32VsYULNn93AYmYgsdrdjosi+dGj2HRDhEAoIFHQBoXqCrCwkO2xBYUo
	wJPJBGu3A4GZvW+rUk3SIzFxxD6lQlOU7gcG9zoTyjQYNReJGGDsMIewMCtWMH8Npbi3ERLtuQV
	8A/9EMojbFDjFaJ/vr1KJiHvCEnL0yh3KlNHa7qPN6T0zTBbAO+Cf/erug==
X-Received: by 2002:a17:906:6a05:b0:c26:1691:b364 with SMTP id
 a640c23a62f3a-c2e23d933b8mr415377766b.29.1790865873484; Thu, 01 Oct 2026
 07:44:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925205328.59183-1-yadavxashutosh@gmail.com> <2026100159-hacked-encourage-fe18@gregkh>
In-Reply-To: <2026100159-hacked-encourage-fe18@gregkh>
From: Ashutosh Yadav <yadavxashutosh@gmail.com>
Date: Thu, 1 Oct 2026 20:14:21 +0530
X-Gm-Features: AclHuK-OooqdkaRpmP1x2HWeRD03tHX4V87tBxPE0qLRSFMhrjyaVBYLYIzeNu8
Message-ID: <CACRQGQPXRaGLTXQ2U2kzeqgNia5_iz2R1XV1B6fnO6W8hSP7hg@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: add missing newlines in sysfs_emit formats
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 14:49, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> Please read the archives for why this patch keeps getting rejected :)

Thank you for the pointer, Greg. I should have searched the archives
before submitting. Lesson learned -- I will do so for future patches.

Regards,
Ashutosh Yadav
