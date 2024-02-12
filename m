Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0F3611B
	for <linux-staging@lists.linux.dev>; Mon, 12 Feb 2024 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707741664; cv=none; b=gLHeqWBROrsMwhrjgPcsIEjjV47D/w/OSrC4dr5WpSqJOPNsfC/6QXB9mGTyWufolcZpyYaxnVeBYHO5LB8bZPs4rog63RleFablxHNDc7dKaVhK3NVJU3vJ9VurprArQhQ1bxbArnQWX6j20DU5I8l2iarByRfRXzjkx16sbhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707741664; c=relaxed/simple;
	bh=mZkjRu0YJBOgkp7rl6pQlgT9GB370CXeoZ2nZPBSCE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShPP/SqYTitpNedLg8Cz0M0QFtxbnc7KiTfPckOx5FzMp8qFKY9ydIKR0MGaD5nqr5NdlfwJnFKS3Lpj6RmzAXOc9f6TaZrqHS0lommBljvk4vvYqynxKDQ0k6t5wOJDWspiwHGTOaMQsRAleqWEQb+Mog7TgANUK0kvkt4m8eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwUgTbR6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwUgTbR6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so1457140f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Feb 2024 04:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707741661; x=1708346461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nspQqwgfBxynKDdiNVKGZX3PnIi01Z3tscyzSXI8s/M=;
        b=IwUgTbR6hZHrcla6OwzlehTpZ8wo9WtaDOh7ys1vhq67/tVxvkzjcwVHfWcf6d7BU6
         6rlr+ZNbpSuo75OT4tQ6dWIrRcSp9tvYRc10QP1RR6ytLIr8F145L3Axo9BvDnq25Tkk
         2mVo+qREemdeh2PJEj0LCiW+bBT/DenEB0cOMvTmZruRWoc8ceKZXlyDK3OXNyp5T85V
         P6Zoy/EvtcEhR4fB8lTdHBqaG432pmL6KZLEdsXFHnsopiaZMxRR35gkM88zU2naTUaX
         I+9aaoL8J7fuogYj5JFgsZbbYGaLk/c3/Jp3zmU+Marp8G6T57jtgF0TpZpzmrXc/fx4
         LIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707741661; x=1708346461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nspQqwgfBxynKDdiNVKGZX3PnIi01Z3tscyzSXI8s/M=;
        b=PDGZ4S+ejabx2gn8ZeGYgTrjckhaHHZW10vLUEebSTFNPmUoLdsJeFYQ4m/lhupxac
         YoS78r/6JlBMkLw/UcrrHLyvDSrtG3e7sEapQdeMNdB2vgWzW2L6ZO/CcRZtP6jnS4n5
         dQMD1cQmgCvsaDP/ijU+fWN5or4LuVTqjRul4/PrGWqh1pGGcgX8Btba4dWAh6wdViYd
         FkpT70gzynFO39Q2Pievwf3AEXeM5fP29977iTpeGK0s3Crpr4grGmNqo33Kh1kNJ8FL
         jJj/BiV6U1A7orXidpphDW2arnTmtc99sQ86hxvQP1Sq1swT7FZL14flcXWT/mKzdTTM
         yFag==
X-Forwarded-Encrypted: i=1; AJvYcCXK3TxT4BqdkGzsKWd4IQptxHF8fFQeK1u7OBeKuEkxq6YmmaHnlsRiL0K7TOV/xzd/WmmnsdNkB6EpNqGYriD2JgtELDHyWdPV7N1h0A==
X-Gm-Message-State: AOJu0YzUqzV5sv6HjtPQXN82AxvyNIxBfk/oEIMP7gUI5R+xf/VsdYo2
	ePre3oPDF+gOXlcRePbq1jfI1FG5eK85rNaL5nPuqhQGk/EOajs5
X-Google-Smtp-Source: AGHT+IH5arOZqlT6RpkeYXbNGLHdfCgiQcJnBWVpS7fRbCWOEYZAAPyd6Va63XCfbSkj84rBKGc0Hw==
X-Received: by 2002:a5d:4b02:0:b0:33b:2138:623c with SMTP id v2-20020a5d4b02000000b0033b2138623cmr6083224wrq.16.1707741660895;
        Mon, 12 Feb 2024 04:41:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnTFj2f4qcgQ4xXfWgYJur/oxmUnM36RYZpWMyNl1vyJ2U5YM9B2rFDtiFMhwSVa29el5bDjNTyvqxLnvcCrzOHxiReSlQZKdOfeTSbBv/jbzJAyVFUcw0JKpKI1yy9zPl3lfJdjFnHSrusGXOuZGyRsbEcb/E+Xv79Fmbm0iMX3oL0Z8Jnp8OO6sGXJu9RCbIZtf07aLojJefccuot0qUVMkBQcRmHyKTh+MyX2UR9/Sdht+o21+Wc7+dTYmL/sgH+m4Ys15tGWV2SbKoCNihjLnPnwvizbL7HYoPCjznV+cNrG3n9EVSVsWrpVt3vUg45FuieiIBa2wynZ88PJqLiNM2zSkUb5/1xUK583qQQdFuEaPtx/6sJXI5+FjU7cs3GqK/fA8MRmsfX9Y0wsiHgnaQPSXFhNUpiHgIF3HjMiQSZqUPZ3sTcUatAY7kVC0GAbsd2O3Wyz3ruXO+LKvppnwRqEJQ98tnbi3PUfv9V638zg/swmjAaYZcNFQVubqTI3k7N/4tovHvY6D84A==
Received: from [192.168.1.135] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id k23-20020a5d5257000000b0033b444a39a9sm6667506wrc.54.2024.02.12.04.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 04:40:59 -0800 (PST)
Message-ID: <5940e2cd-64f9-45d6-9e1d-e9a1d14c8ad9@gmail.com>
Date: Mon, 12 Feb 2024 13:40:57 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] Add ISP 3A for StarFive
Content-Language: en-US, ca-ES, es-ES
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian <ming.qian@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240205090424.40302-1-changhuang.liang@starfivetech.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240205090424.40302-1-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Changhuang,

On 05/02/2024 10:04, Changhuang Liang wrote:
> Changhuang Liang (13):
>    media: starfive: Add JH7110 ISP module definitions
>    media: Documentation: Add description for StarFive ISP metadata
>      formats
>    media: videodev2.h, v4l2-ioctl: Add StarFive ISP meta buffer format
>    staging: media: starfive: Add a params sink pad and a scd source pad
>      for ISP
>    staging: media: starfive: Separate buffer from ISP hardware operation
>    staging: media: starfive: Separate buffer be a common file
>    staging: media: starfive: Separate ISP hardware from capture device
>    staging: media: starfive: Add for StarFive ISP 3A SC
>    staging: media: starfive: Update ISP initialise config for 3A
>    staging: media: starfive: Add V4L2_CAP_IO_MC capability
>    staging: media: starfive: Add ISP params video device
>    staging: media: starfive: Add ISP parameters hardware configure
>    admin-guide: media: Update documents for StarFive Camera Subsystem

I think instead of adding more support on top of the staging driver, the first 
step would be to get the driver out of staging and make it a regular Linux 
driver. After that new HW support should be added.

Regards,
Matthias
