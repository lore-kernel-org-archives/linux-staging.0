Received: from mail-ej2-f27.google.com (mail-ej2-f27.google.com [74.125.228.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98483612E7
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.155
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929495; cv=pass; b=jqexmaaYiucfshSbBElWl7W0ys0BY0iNXUbInz680FtXcthFjNmTVN+BCvThLkcqU5FtHgJiGEuXsxgh0ehNanoSqHvv32u8TXsHA3uyKOG3GjxyxReqropA0lNBZbmybJ/AzuAyRC/mGJ2xaCGO1hdMLwTP7r8Tewf44ktw790=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929495; c=relaxed/simple;
	bh=KlIxB3DMOBjHkj3qfvKkhWtQBR4BYmDHWWCcFBUyWG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ehFWiH9Pn7mwCans4+DNT64MdPQ6pDNg32FtfWWbNQRk5on64gfFl+ZhDOGbP+QjcrkvmUMHFHbCTNRaILkg1bGUEorXXNd/NZAknUzw5l6JTdBqNtZzsem/O0TrBuik0ZBXte3EGjzlfP/VcBR/E4tX3morc2KT+ITwFCnLPCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBBjTODI; arc=pass smtp.client-ip=74.125.228.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBBjTODI"
Received: by mail-ej2-f27.google.com with SMTP id a640c23a62f3a-c2e201b7189so453080166b.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 01:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929492; cv=none;
        d=google.com; s=arc-20260327;
        b=VnHrqc3UtqnPh/ltgYxh4EB3kkgHKF2qTboc6bIwZrTfwbJ5f/lOMeR4iEuqs4fqbf
         kBmEaRFNrPNXVGCoNRr6QR2XWBgCohAnPdq3K2/s2aVuBIU3dF3AB1Z8x6VGjO5lukvX
         sHlxzxedXi+cfML2f0WLBnEmTFUsm/Wr9hyv7kkEbDW9RDegMO+RuwYQNoCBIrXTEPes
         wdk7ElISCnzNO4IvNHQ+i41k+lZA3kfTyfbRXQX+ecXV27qWqBSVjEsWS6V/0tb5nRUX
         SuwoGXn3ArgI8R5PbTPKgpzs1SbhThKleHPX0bmASkgVehOIMh7ceqJEBei4KKmuhalJ
         l+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        fh=/5lOebgeIzt0/Ns+v3XayAr8HdWIZz6EsDgZae1VbcI=;
        b=EHi8bSFtOmIe68BtLtefQyodSCaua6QpapR1IrrffeE5SeIeZce/k3B6YGsX2lRj6l
         RNCtOd6F0VRE2Ntr/azNDhWOX54GDSyGXepFNl90rs0/lTzlS1d/gURq5HoUVkyCmCpf
         qQoTTreXDnP2Z9y9GDk2wYsrVeh948MGNpEfvARNOEnx3qSjDwK16wk1NnxUSXEReMUO
         FfzXCNJHBFYLlM7pewfb/seROV2hHN8qqE5YMjQbFLFlSbvQ8tENpWoaQO1f5kUJXaQj
         DbwX3Hvv18MNeOv/kfGyBYDiEX1GPYTj42H/l7Rcc8+JuEEYJexgjGm7SehNIZbvmnJG
         7NCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929492; x=1791534292; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        b=NBBjTODInauyKiQ9rjNsg1TwB0sXLdeUw5Rby0XqoflpHWvbCG2RiFWcqleexnZLXE
         JCxD2SNFO4inG5TlptsMJZELm3wnW2A+0bApW05RatRHZ6rEwCPtbRxnkodokXaE3iOt
         qgxACX56tsds9/t2qrwbmAklzT/mw5HjzctZNu7fv3yRRSo/AtuBfBV5tAL7V7jvpKfA
         RsWe2PTUQ3mgGeLXBcDMzCccor135HLqVQhusJn4ThzkLJyvindWyamWuCINr0wYJK56
         9hgRd40YeGs+FbY1BKBIUxzhi1/KUGDSTQ6flw4ylZSVFVK/EZSi3r8NKE0I7Hw8GkLG
         zCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929492; x=1791534292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLL38YXRs8v13bhjczR68f1fMy6oYgiP+2Rp4B5sHZs=;
        b=QUN+x6L8ZyICHtzZaOodMMDN8poLGbW5WoJ6ImIUsjNo+cpVCdychK7qM3NQ2dnIrd
         H1L1aNy6R9JiNtL1r8FNEzofbLMWMUBGuJFozO5Ai/xsP2F77GRbB4K037eGNRU70FKt
         Z46SpnGrQXtviclhXYjEl7pPHt5N8cvqDKg37qGAVhNiziWwY3jHQFWAQpYfBWHdxVlg
         iSGJfzy/OEslpq0tTkEm8VxuD6NnXL/Adfr826yCIccz1t/xv5n5z8g2B3nrRH/9rwEc
         ZWYoUmqJTmE2LLsjQLxkz/fvMe3of4TCYWLe0av2bsVhDAlb1pThWLkcd5K79vki7Ge0
         j1FA==
X-Forwarded-Encrypted: i=1; AKwUvBwN+DBX84AU9sxgvdcS9SOpEIdUZIuElRP22upiVGFDWuq8jhKqHUtoIm22NZNgFzBMWikISeSvLGv7vf/X@lists.linux.dev
X-Gm-Message-State: AFuF++kf4LRrSzdSOpM1GKAjdCOy8x8fWDAz7btkQsyT5EwPPNP4i8ve
	Xvt/o2zU/AZrHe2+T5cXTQ5owbw1yaY2ZA745Ym7tv/wU+NVu1kNaz8cbBssEciQKgECoXo3sxL
	FgvEnLNW6QwNiBeKtrqWo/taWs9I2Zy4=
X-Gm-Gg: AYBFou1NxQVT5gHnprhYcZYVZjeOtHjFmsbXgPLRQpUPqRy2eLgOEhmX3l9iIE48jxv
	7u9eLKQ6VCqOwdHf3FZa/w3XJMVcZJ0T6xBX3I+jqZQHs2DbDBrohZ/jLjmAdpatkwzm53fyt96
	0bwNoQG9zoTsXV3epc+ysBnpqAS1lFZB4HcS2Rcd2tq+Kc6IsoNpiB1CIOc8BtNH054v5M+Vr8z
	0n5gtaV3ckkV5ca8EZFmFI4UqSzltabg3bZSD932RdrYL+BaGa8ngbJXMcU1bnXjo0JdJfbuZz/
	dZ+9L0UnUQKVg/1nULij+ApiFw+4axxtx5Hi4Stz6mw3o6rsFeGoaYS9Fzx+hP7agHTW5Nblv1D
	CEaHvRjXDDHNVEgCg+TKa/OZFO2vDwZPllSVwbzR0rUwh6swddX4M1LI450Ow1B6mMLJH/uv9vF
	nkvG/9U9FN1rCpBLuGnAwuic+MnyyqbkLC+Q1aMRZz
X-Received: by 2002:a17:907:1c98:b0:c2e:3152:6a78 with SMTP id
 a640c23a62f3a-c2e4ad7918emr175853666b.15.1790929491855; Fri, 02 Oct 2026
 01:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Oct 2026 11:24:14 +0300
X-Gm-Features: AclHuK-EFQV5WhAXMWIxmr7qjCCaiLixTX8idKJX50cwoXk48nStXfS5xiZzZ-Q
Message-ID: <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] media: Add Lenovo Yoga Book camera support
To: mauriziocasciano7@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 11:16=E2=80=AFAM <mauriziocasciano7@gmail.com> wrote=
:
>
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase change=
s
> only three source line wraps needed by the media 80-column check:
>
> - W=3D1 builds and sparse builds of all eight affected objects passed bot=
h
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:

You haven't even read what you sent, right?
Your series is mangled (has a garbage), please, *always* read and test
what you are sending before actually click the "send" button!

--=20
With Best Regards,
Andy Shevchenko
