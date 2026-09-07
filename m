Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988B51FCC6
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 17:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803754; cv=pass; b=WkrayRy8pZWLRjxBcjAptfEDTPQe7skCN4sa2tkjL3VV8TcUVl0XsjOG6i7TTDzt5O96fz/QsPqdaP8yOZ8OBo8wgmTcENNVITmGycjWEHPbgDLYZ09uEzRhyROvyhZd61A+ilVV4A3NoMsiokYVA5RxS2u8TsD08RHUFrNpmQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803754; c=relaxed/simple;
	bh=VTn5xM0BByZGDzeaW7HKnMpQYAJ2GObAR+ycPlMJjRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgNBTfVbIzbPjvQ/NbieXjHEbJW1RklKsIMR4iYVxc65jwmKjl4BYq5ZkkpSBhlCdRsRrkXArbU4CMDkWF0QnF6RHQBvjqNFJGNtGMWButLEIUqSyxA68liYV2yEVOpHf9xd1rdTMKhhoTCBj/+4E8D7MB9eSOAweVGlNpL1MB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZxoF61e; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZxoF61e"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c25420fe973so640866866b.0
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 10:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788803751; cv=none;
        d=google.com; s=arc-20260327;
        b=H3FJd3fdVfnS7BdNvrM0LvBmtmzFhOKccglAiWSOfy0kq8hN63VuQPkqJ6oCLmKwgj
         a/iza1X+twOBlQqVL3Kkr8a4bDb8oJAn2QuXGai/7pH4Syf4J6dNYRofvolF5rm8CqnU
         ok7IF/+RtQI0LWIDoLi0sEvDq14lXK3adXFBikotpvwOhJp4MIscy0XiZJeTWQxnlIRQ
         JA+LSSJpdIej0GF+NMX+JLK925v7ftLnmpSc3aRwMX9Noxo8+OeKnfgN3zobw+Ku4lvx
         PZQ3koS52FcbwWRlBnlQCKGQUwABT1JnahvVz6ZdLtsWh0Pb6H/xyPtKfZJKptkiKEgb
         +5Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        fh=YId8f48oLdxHjFM3Kp76DSQnAtD+uheqS94iJkPcr3Q=;
        b=Ww52lseIWektfYg7yjVBnNbNwf37p0jzy6IrVufsy1s2DigsBRY/abmTnRQgKeLdE5
         N/xAZxMQLlUn5LodE4gUHk/B7rKbDO87BR2FEtJYnfCtrAxq8ZpaXfsRCfrmvkaY9RVG
         gqKLdhx5236rUjcDdleRRqGwIWTAOO+yceUWYH0QdzfiAjQW7hHfRKGQwhEn8kLJ0ewc
         MCuRdD/YCBm0BrTu8KJ9PaN+rMUtz8qiQ/+zn4A7/G1/3E1BKUh7HbdTFB1yXBXEDLa6
         DOo/NgfRUYEt9wkHBvLbrndwNAAc5tk49k2xUx4WRZSVMVfI3W5vY+ekfjG+8d7Fidh6
         DExA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788803751; x=1789408551; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        b=eZxoF61eMFF9EKuPwVvM3Rxpa4bUmZWLcaayBUJTZLZQX+l6cgHr911VQKbLtwMhop
         IFo3kqK3muZ79FvmVnUcGNSkaLOfVSCYpKI9v33EUcm45+UgdV42DCNiBc8xAbln8I+h
         GJJZF4PtApC6tZKTHLAlg72rorHuzkWMI4dPL/4s1EPiQEWhMbx2jSYJ14TKGPkv49Pl
         UpGA+vWNg0XN1dYlfxbElrUT6CRyM+OVFQK3ZllLKl+jSuIs/AL6OjjuLRDLJvh3ed72
         xAn5Q+6HjwKKqNRCJdTBhlwKtZDxm+VH46ZnMG5/agRtQIzPa4OIxSgZGHs/JmIexA6I
         07+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788803751; x=1789408551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncQ9wxRqAVfRdvJQryVlL0w77BiybYqrTlZQ4e8MWAU=;
        b=mq+UeEqrKPhDKzp6wvM0YhOeorwH8uzRjfuj1hRsqvMNFIdQ5N1W+qYisXpFqAfDbc
         SUINeeQqoqvlMxo6R+Z5ixnWyJM+Mi9J7G2VzUnXXoAc83GO7thDu26yMkOUXHmPwCMw
         oAxb54pVpcFuSLO08QNXH7nh1toy5Zz+Vo1WyQObJpytin+DRBy1wqCkYNEN/Lzi/yr4
         KByA6bYXPer+MvVrFGa9PFY3sU4e0GkW54PaVyBuyb97LN+nRH/Kgzti6SucClIZFGPG
         Yph7pBU/XGLlUpGZJURX4qyzx2IpuCWswKb3IZX4rNU2xF7JeJ3sP84wr3dnvzi8p7M8
         y92A==
X-Forwarded-Encrypted: i=1; AKwUvBygD7LXP0Q7xRZ5UA/I7rFvvkgdbn0BH1S+9cFXQBA26tugP4Gnglhm2/I3U/SSaHroJcPEWaOS4D8t0jKi@lists.linux.dev
X-Gm-Message-State: AFuF++l9SW9f305TJVVZM3uJk8AQ0k8yQvvTCf+ZgemPsu8SDiQz+GqT
	0n9MhTEUgGSrqxt8EucGbYOttC+NuDdC8BTrvldAy+7qQaSTeXadXdsyXldrYzpzzhN3chPY3Kp
	s7NCwaiuOwPS+1Csl6+ymD2GhDgy3/MI=
X-Gm-Gg: AYBFou1zl3t+7lNJNjMdnF5zQY+2OHNYiL2+xMouJvQEsQh01uAasZNRUlL9J3XXrmw
	xf5ZS0qHKedv7FdSnrkhtGeKzdhLWqELYisSLDpXSK9O+zHmsVpYVMXPCap+W5WAhvB5OtKUyVw
	oIeOfRTbFmMoWy2gcepb+2NtEQptRpWSfJF53WObCkvw32w5fgOKIngmncfipJMgIjsg6YHXQO1
	QM/oTBFhXehhkDH7YjXZnrnarKDEPSa7OfzhwH4pt0ECQOsXNaBsitiUt4wKx5G9cNoNnznQ2XP
	eRMJAh34gg4bGkWEoqdGKi546aKpAkzw5QuoG0V0vcD5sYCKDoykBMq8V9dUoAKa3EqQghEs8w0
	MacNJ6VsaNgLuObz2BweS+s85H70HSYydBTXSfRG8hrXI7rOrIwEhcx0KIEzEdohs8I+/sIU6lk
	xbA2acrqXg6OL8uYbh6zQuGwivhVbdDw==
X-Received: by 2002:a17:906:7956:b0:c1f:c061:569a with SMTP id
 a640c23a62f3a-c260c7ad26cmr891917366b.7.1788803750800; Mon, 07 Sep 2026
 10:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907165033.8460-1-lalitshankarch@gmail.com>
In-Reply-To: <20260907165033.8460-1-lalitshankarch@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 20:55:14 +0300
X-Gm-Features: AcwNN1X4dW08JTgOmtGLWwxfBMjDqVtnJdTI6vze5rZDBBq6vA-ax46gyB9xRcc
Message-ID: <CAHp75VdsCtQ5aSLB58fXcJTpQDRkgXOFyhTjtvOMCfSyAp3TvQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: media: atomisp: Use C99 initializers for ACPI IDs
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:STAGING - ATOMISP DRIVER" <linux-media@vger.kernel.org>, 
	"open list:INTEL MID (Mobile Internet Device) PLATFORM" <linux-kernel@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 7:50=E2=80=AFPM Lalit Shankar Chowdhury
<lalitshankarch@gmail.com> wrote:
>
> Use designated initializers for the ACPI ID tables.

>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--

These drivers should be gone in the future (and the regular ones from
v4l2 should be in use),  but so far if somebody is happy to take this
patch,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
