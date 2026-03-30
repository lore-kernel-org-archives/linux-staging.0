Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA89F3B19A0
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774860702; cv=pass; b=g/n8aXpnidJThQg4hCrurn1qih7b6/2keGTq1gj5FE+KanuCjpo+btuC8LZ+7YEs5KQ0cqNBDR8i6AtS7I75uH1+xbcRxLojqsT0IEet8sPNtNs9zeDsCj6Ca5uYtdMJjjAiBanebg+w+yqsqpt+zBZgwFHQcrTFS3EHaLftoTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774860702; c=relaxed/simple;
	bh=gNhDkeZ73nB1ETLE4Qx9gKY8ay61huEBziaX2ObnaJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGLPei4F8MiYrP+mBMiGLzoLsINB3yvwT+nIcbY/Di7nmE48L2UW8BAc8pXZzRZ75FXcpndgruaCUHCEjqHU1K8+rn7SRXO44MopcfL7qps64XSThiovfHvmrkp0mJvRJqSfv1mOQm5Zg5+Qxh9AnvcuGu07ERauk4r5gyNzFC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coN0UxO5; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coN0UxO5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9358dd7f79so761394866b.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 01:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774860698; cv=none;
        d=google.com; s=arc-20240605;
        b=BkoNisDTIf4Kun5NTqhaQiUXVhTG+XZHP09Iw0eIQ+uPQdO6NrGS6+b4V5ywXnxaDZ
         q3MsDsMgpbOlQ7F7dVhzOuwR0QGnCD2QsvsR/qXPv1DvOqyrZhFmKCnhPlQgR1spuUIc
         nxi6KzsHkgxuaAj1ntfWL43EbaZFXUC/+MxKboJUBD9fXGgsNr8u+bN/c3NCiLWB2fC2
         Wcf35gyOXMWX6xYDMHVmu1rBwLifin7WL3VJN0IfQSSd7k0z0I+HH5bQwGJtUKsyp4Rx
         WW4rwigVi0lbxKPKfe/1GqmFqnQw4+LzssQxJx0w9yqlS9JmVA/kfamwJsnzhPoKRfMb
         iVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gNhDkeZ73nB1ETLE4Qx9gKY8ay61huEBziaX2ObnaJA=;
        fh=JGFW3AgvauJyhxkDTdXhA2caqYOyzwH8tPPdWSkH9X0=;
        b=geaCuC527v6kofAHw8gNLbguPZbog2TztOHUI88rDLd4TbnKS8MnMSjOOdXLS52y6B
         vzpHImEqEC8HC9xmDPoZlQIJxCmeKEsiPIBjXoWouKZLiDKtXeJciuR1/KPXnxGFQQ6Q
         c2rJJMKA5rYRE2hQ2fPvQGqUqXLHqWSR5NXb/zHbIjXts12WzTcfMApsYUU10JqugJX9
         gitwKRBSxIiig4mAWeVzpXJQw8J/EFC94Ya9csOY7L/WMtT8+NnlBv661OG5nf8LdXmY
         J6hihQsDkGG4hZhPd+btvYVEdveMv2yWdkTJk0zqZVenTNERg5GN3u700YZxtB1ABtoB
         /xdg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774860698; x=1775465498; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNhDkeZ73nB1ETLE4Qx9gKY8ay61huEBziaX2ObnaJA=;
        b=coN0UxO540OyO0iCSFNf1s4KAubPIoGLDIL7FYy09DoCMHp/7X5/ovfP41TExKd+Lf
         3bG59ZHT1nGWk1WabadrBuz3T6568i59z02k52SCBfKRf4lyuBf/3C8VMVPxUo8bxtwC
         aXIpdTLtnzhPPg+egFUrId49/rqN7+qW6OrsaXMyuVn6X7RxGuNDpk3lwO2j8CuWOTg6
         xex7waxrqlKR8zd74tQwXiRpdszhBgP+ZOVf7Sx8XDzNdmwTEpJmqTGA941q0tqwUw5M
         Y9RQyfjhuqKRlrAMfOPLQfHZTOSiUDDSjYesudVzRr4Z4drLFvhQk+BtpA/TfTtb3iCc
         KrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774860698; x=1775465498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNhDkeZ73nB1ETLE4Qx9gKY8ay61huEBziaX2ObnaJA=;
        b=NbvE40DOF2PFdtd2vJy0eHA8r17tSX5m1sNm1fBVlQIY6YLG23eshJVd/y/nPjGvAm
         00CzVethv+f1BYExZ/CifaDRXK/WYWFnoqsgmTwPy+bbcL8so5dDUO7yw0nVV3ZWknzC
         fA9Op1MWdYMUvfcOHE0qCs2HRHx9+r+mRozcaYBd6CFRDno6rlbFV+cC6dfapeSizkXf
         /RtEUMSJi1i8V5z5Sg+1IR75TbMaM5PZTFKkSaOVKv4G4CezSf/nOwxWo6RQ4sd4dDQN
         tmfhbpbR/FOL3XCrJRO+9Zcb6JD/WBQCQQRIkNF4jcs+jREpyXDpWBWZAdEmrJWISR0K
         nr0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJcYMOedYYx10ovYz40Cfgg4CdbrSM/03JTFYHIHxKtAYNZboJqQeHBOfTKh26Ml6nsgRUVxfYoRPmV+lD@lists.linux.dev
X-Gm-Message-State: AOJu0YzyaNeAm427skKg9HfueUuJAPIdoJl3Q8Xng2hEDAcjwdDkGR94
	FOk2+sUKy7KZZbxtTyg7uP4sXtC2v3t26Eo46uLtzShb1pOf3OGntBeQaMkbhgnR9Brbnu1N0sR
	x2hmo4g7n/8+eVj1qSw0bsLYedIidlDR+ba++
X-Gm-Gg: ATEYQzwnLEXLUlQvB3HQVn60WPFfb7jxXB1mR8u+MtTcZEmOgIpO9LGRQ1PUvJo9wV4
	bMTY/MZH9vrS8dgpX47k2UQd2pGr8+uHV0GEdjWYFGbaspZcWTXVOuff4WOc/RA+DOGVc9XuURH
	6QTp4KWKH1ewejE8rlt3iuWqsL6jrv8shEMzLdgPe2QD/aDioCIWrdoH8mlznd4s/GBDGgUhPHS
	g05Q1ex03BNVFg4yAdJ1u3UOXrzOVVqfZG7+Yo8CCywcLw+WiO9tFBJDMJzv4HQRWScBEQ9q5E0
	sZL8ag9CWD5WRbdIldK5NA+ovKmVNXnCNkkFtNQu5kzBOfw9NYb91oyNiUHuo+CXyIc4skJRJ+F
	I9UpibPI=
X-Received: by 2002:a17:907:7b06:b0:b98:3e1d:b133 with SMTP id
 a640c23a62f3a-b9b50942ef2mr752303266b.44.1774860697550; Mon, 30 Mar 2026
 01:51:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com> <20260330073549.5782-2-robyserbanpascu06@gmail.com>
In-Reply-To: <20260330073549.5782-2-robyserbanpascu06@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Mar 2026 11:51:01 +0300
X-Gm-Features: AQROBzAoJGM75bwef6q33_iMYnEy6BAnkHip-IRTC0jMuAJlxDrZ_xLiZhSa-fQ
Message-ID: <CAHp75VeQTNNgzhb1_52F=j_oWgURb6WdMMtOT5U0X+iXogbk1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] staging: media: atomisp: fix SPDX license
 identifier style
To: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	sakari.ailus@linux.intel.com, andy@kernel.org, daniel.baluta@nxp.com, 
	simona.toaca@nxp.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, d-gole@ti.com, 
	m-chadhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 10:36=E2=80=AFAM Serban-Pascu Robert
<robyserbanpascu06@gmail.com> wrote:
>
> Use the C-style block comment for the SPDX license identifier in the
> header file as per Linux kernel coding standards.

I am not sure about this. I believe this should be considered with an
additional thought. The thing is, AFAIU, that the header is a
combination of a few from original driver code where they have
different licensing. If Sakari thinks this is okay, the change is
good.

...

> --- a/drivers/staging/media/atomisp/pci/system_global.h
> +++ b/drivers/staging/media/atomisp/pci/system_global.h
> @@ -1,5 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -// SPDX-License-Identifier: GPL-2.0-or-later
> +/* SPDX-License-Identifier: GPL-2.0-or-later */


--=20
With Best Regards,
Andy Shevchenko
