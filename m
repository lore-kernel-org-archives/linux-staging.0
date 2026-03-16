Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B329BD90
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 22:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700066; cv=none; b=n7UzDaS6uknmKzMiXW4tffP8bvZ26us3ijHt1cSFyUiAWAhfntoy32TgJH/6vKPv5wf6Aw5uyem4ohQKUCpA7oKPQDsCLB6vTSVKX3aYM1x3UJBZ/t0Q2X3bfdNBiChd46naqM77UhWIJJn9PYZuz1U5p8GNBZYpP4bGQP1FkYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700066; c=relaxed/simple;
	bh=Tpza4+6K8I/NWbGIY+DT3pE8PRDCA3LtWV1DRAkh9xA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eZD/B+eZiD4RXERVGqtb9kIt/NJXv8pdWB7AED5U2goiN8PnR3sliHDtgSe7JjAacO7PIa81JrHlUA1G/aeukAxUQ2ibhD1sUvxh0mlbue2R8auQwiyLNIyCnh7u2B7g8lMH/AeI9PW7PtSJIkkf7bs7jM03BjGWft2w8HjcHxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mia9ghFP; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mia9ghFP"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7986e538decso41942307b3.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 15:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773700064; x=1774304864; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Vb5g/rkADgsShm9+VtelJ4BQsoHYpcByRPsV6VwUMg=;
        b=Mia9ghFPH3XI3rt+sCaTMN3RWtO5baHB7MjXdB9aqMP/eq5xBsYkzIV9bNcPVfwkaZ
         4xnbMTna7nSlV5IVXd1Gyk4kpPVlSbvkrg+Ny8Aq/pokWMLhQ2S/lfb8fTftWXcHK4Ri
         64h0eXqlLCJHbeMvDc6RLituhNm+vMltae2pcxYuqssNPGtz0HsBY9Y1YPudQJAjAuEN
         9qHS/EG2F+jNGmXcb3qSaBS9UYXdD/bWrQUO3cNEVXStIc84ni9CLtCOGHU7zu5/13+X
         s+Hylr6qz1VXtHWIlnJVE9dm6ZwYoP+C+J8grMnUKgLKdh9lIDIv4qhItKj2ZMnjeE+W
         VDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700064; x=1774304864;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Vb5g/rkADgsShm9+VtelJ4BQsoHYpcByRPsV6VwUMg=;
        b=Kt4X9pbDy5TK2LuDt1sAmf+sxUhGvyHpyGnO8/tUV5ojtK9fpo6wdOFHew1lbduF6s
         Nthk+tfYzaXaqFSpKWOAadJahEYKxjTvgys+7fKqZvL2FkIH3RhQ7be4f/adda+dYmml
         VWs7sBZ7p9NkHndLSEjpvvoxAOM0LsrjKeFvYeLgR8kNjDbtFCJy9GvyamzTqr0f87/s
         gDTGJdDvoJhmmressrB2VlvvUUTuca2jXR77tQVY1k+BcyW7oa9Kc8MYjOK562NS03bH
         jMxxMBU8ZfidD+G2NTHzb+UsAvyU0i4wrxbVhbIGkqoxT+Ww/cDCr0VQILo7XdfMUeoE
         2YVg==
X-Gm-Message-State: AOJu0YwHhMDBU0w/L7jSPzybPTAmOWvcBsZhzT+M6ZoSh8H9TgP8xbhR
	EbrADpAal1JVaMQK0SKC232BfOYPtRd/UXeCodcFtqPMqkKk5qRuIRwA
X-Gm-Gg: ATEYQzyGxH4wglfq+7zT5CJTLeq3mHwLScffjY8KBcqifhnCEEdWCOJJtqPEQjpDpAs
	0WExsKZ7S8wkHdOok50G3rq/gd0Dk/rpYDals14oBUNoAymsFh2/jDVDUA7Caw98RgNkzPbvYLT
	SLYk0U1IPKQ6YzeJeHKJKcLC9SamYA8jm2HCZDpg7VFGso6NdF7scV2b3+lKDr10L+yxreMWvjg
	9ExweMjVmm36ZbDSqR0OyaWRlVsnKHRVYTIrOFhLseLac+XxLKdZlc1jeOcTXBXLjZZIE+tu/k9
	VSupXmYuKhkm948VxapEMFWA2C8nNiLWifjas3Pum64Ib1DNRp/HEx9s+OjHdVsSWWDmmSKId56
	8c03zLRyi3W94uOfhsgCYcUKXI95ada4OToi2D0c1ULsqA6CixKRS5ZakgHfcdHTOtwhtVTkxxe
	9UFWVP/2taEp7qD3ZLPhOhx+BzPwLm7LxiHMfF4xMReDQTpbLFoFgaG8ZED6TEOdKdPw01AGcGH
	CkpgsJj12rSEHUeQDjAsI5r2zfToMOc
X-Received: by 2002:a05:690c:e3c7:b0:79a:616d:b33b with SMTP id 00721157ae682-79a616db80cmr14531387b3.13.1773700064532;
        Mon, 16 Mar 2026 15:27:44 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a2de73263sm46963287b3.43.2026.03.16.15.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 15:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 17:27:23 -0500
Message-Id: <DH4K6V738APU.7I409JZ3NS03@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unused global efuse
 variables
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, "Marcos Andrade"
 <marcosandrade95963@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260316220435.2249-1-marcosandrade95963@gmail.com>
 <DH4K6E4V7UNG.13JD41LI1U7MO@gmail.com>
In-Reply-To: <DH4K6E4V7UNG.13JD41LI1U7MO@gmail.com>

On Mon Mar 16, 2026 at 5:26 PM CDT, Ethan Tidmore wrote:
> On Mon Mar 16, 2026 at 5:04 PM CDT, Marcos Andrade wrote:
>> Remove several global efuse variables from rtw_efuse.c and their
>> corresponding extern declarations in rtw_efuse.h.
>>
>> These variables (fakeEfuseBank, BTEfuseUsedBytes, etc.) are completely
>> unused legacy code. The driver currently maintains the efuse state
>> properly within the 'efuse_hal' structure, which is encapsulated
>> inside 'hal_com_data'.
>>
>> The removal of this dead code cleans up the global namespace and
>> resolves multiple checkpatch.pl warnings regarding CamelCase naming
>> conventions. Verified by compilation that no functional code references
>> these variables.
>>
>> Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
>> Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
>> ---
>> Changes in v2:
>>  - Collected Reviewed-by tag from Ethan Tidmore.
>
> You don't have to do this. Normally you only do this would a reivewer
> gives you specifc instructions to do and then you can add their RB tag
> with their approval.
>
> Thanks,
>
> ET

With that said, you don't have to do anything now, just keep it in mind
for next time.

Thanks,

ET
