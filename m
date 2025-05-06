Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6E4B1E70
	for <linux-staging@lists.linux.dev>; Tue,  6 May 2025 19:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560783; cv=none; b=lFR3KInRkv1j7msCIXrZqNsl16HtM/aCca8CYlED1fj1oQsHDBTgNZwPpI2p7jGjZamG1gpAF1uIkZ3xYu1xAyCCFPNiLeN3oKNBlAEK4DDZaLrqLKpYl/vdIA+NisbfhV1JDg51E0DMcf2kNgMObtgNlyS6/Ymtcr2RVsCwpns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560783; c=relaxed/simple;
	bh=nyBFWOS16j2iYBmOVbC3IgQlsPucbfukndKQCZErJBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lxqI2ME3cArf4Sv6PQhSf3uxij/+RxtjtGI7fIk3qEcivprrrqChXriwuaoZLu6Ugl1GS0AHJoN2hKRXfSc6tuMPAsb0M9jwNdkTaOBp37oqHL9s4PyN7WUO07/hlRAfE8bHv06Qai4oe4VNfS1T/JX6gRfDqObURn1MqlAma7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cysqHtz+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cysqHtz+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso8499221a12.3
        for <linux-staging@lists.linux.dev>; Tue, 06 May 2025 12:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746560779; x=1747165579; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smuCQykHT+vVpyG3o1FnOfymv4/KjoNvv2ZwLmkWFQc=;
        b=cysqHtz+F7+GlWzNUY3iOQvA/S6QdGqVlEU3NoYW7NugcI/+g/E09ywpzbR40LFcuf
         3TZXjenPixG3Im1V5Y7JPmBkXsaUJd0K8VtitH7+MccOSwWnLlnF1CcD0V4NZ1HCNJ+R
         21nJ/OFYLVJRi1oluZ5/EE22iuafYzMaU/d4/7E2GiQb6Ok46zHLmP0dZIF0eN4wykK9
         ugRqRKsarqD0jEg8yH6ryNN7NW7+m3Du1ClWc5Aa2Cxb/u6nigqgbtllmJh/q1vGrkF4
         FEDRkGnypqh2ZgwD0KXzNIDLDthBDH99VHKzADKcbTenIg2vMmigkh3wUzAX0gDXDIgn
         WA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746560779; x=1747165579;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smuCQykHT+vVpyG3o1FnOfymv4/KjoNvv2ZwLmkWFQc=;
        b=P27PBLb8Xio6NPJkNhzA8imd466NcpcwbuqXW6/d3ignCxEZ2uglBiKDz4wNsbuCe4
         PtW+UjBgP3fyPGYofu86Bom09/bHzG2PLEv9FmU0bvpOMOAG74MExka9S7BRZ0Ab0xUN
         qXhzqKkUNEKfMMUfl7qMiwYt9yUpE1mFYjWOVRLKBGTVC/1QL5Ivb0GccGDMX/QNts4b
         nU9w8y3Ze7M0H2pP6gjS8veEiaTITF0iKwXtli2YBIfFJlTJh16oG9xwSJzkhoRvKdrE
         MevCt2u8nkwZl36PgkDQrGoaePctx2DYcjOGXVs2/6/MnNQAO29mHp5aUsKH0Nbu27kK
         0i6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVixH2rIEJna9uq+knXamYyqHiInoXTfniB8iiPX2OKrqlSQ19nK4YJB/iMAjwRsBBY8PTvJQ+I4k9bPE/K@lists.linux.dev
X-Gm-Message-State: AOJu0YxF/zYQT2f75hatew6DszQEDmgc47b7j8UblgYVF8aKJp6Fj9JJ
	5a1odxZ3hRXDklpCqM05sYyiiCBJsV0V4u1F2Hwj0Gw89HMvuZ18
X-Gm-Gg: ASbGncsPrgxFdwETXlyxbSPDnN0oLTCMuN4plC5tdD2cIQpVNkTAtVS4kxqOKH+Dkfu
	U3AtJrkgCmaVgLpZhtgOYCAngQOKx9rKHJU7VUBij7/xv1ywIXCL6ZOXqC4BNj3bWL73/DSW2rq
	6cbZsgTs1dWyF7UgNjf2+LnKrfv5zB5lk8ovjeMEERT8oqmermUwjpSEzCLgDa0XGNbQYPWOdrA
	tJalDsm/vWi89TmZO6DAz01Zy+tVeFQE5awphar+ggWc/uCWDw+PTSLlzBITqAo3vZU/5mdkXII
	wJPdYgHuiIlwDeUNbmQ2W84Qbt7JHkqve5ObMF4nR/VxRA==
X-Google-Smtp-Source: AGHT+IHF3pcKHZxx5T+TWyDWO6i8RnZU06h3QHjYT6OlLwaA6F+B11QDpeLyDwyzcv9mQtYOntSFew==
X-Received: by 2002:a05:6402:1d4e:b0:5fa:8277:6031 with SMTP id 4fb4d7f45d1cf-5fbe9f3c5a1mr395090a12.26.1746560778503;
        Tue, 06 May 2025 12:46:18 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fbcca170e0sm786106a12.3.2025.05.06.12.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:46:17 -0700 (PDT)
Message-ID: <eb2f0337-9261-4867-b6e2-dd6ca2fd25fa@gmail.com>
Date: Tue, 6 May 2025 22:46:11 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/16] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Jakub Kostiw <jakub.kostiw@videtronic.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Taniya Das <quic_tdas@quicinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Eric Biggers <ebiggers@google.com>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Ross Burton <ross.burton@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Zhi Mao <zhi.mao@mediatek.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ihor Matushchak <ihor.matushchak@foobox.net>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250309084814.3114794-1-demonsingur@gmail.com>
 <20250309084814.3114794-13-demonsingur@gmail.com>
 <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
 <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
 <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <d4165e96-7587-471c-a7c5-ffa26531a796@videtronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/25 10:15 PM, Jakub Kostiw wrote:
>  > I'm aware of this issue and had it fixed locally, just haven't submitted
>  > a new version yet.
> 
> Great !
> 
>  > Are you setting a specific polarity on the lanes? I've validated
>  > MAX96714 (after the upstream submission) myself and it works.
> 
> Our design has all lanes inverted, so we used:
> lane-polarities = <1 1 1>;
> 

Got it.

Can you revert the change you made to polarity_on_physical_lanes, and
try the following?

diff --git a/drivers/media/i2c/maxim-serdes/max9296a.c 
b/drivers/media/i2c/maxim-serdes/max9296a.c
index f48f5b68a750..dea0518fd790 100644
--- a/drivers/media/i2c/maxim-serdes/max9296a.c
+++ b/drivers/media/i2c/maxim-serdes/max9296a.c
@@ -474,7 +474,7 @@ static int max9296a_init_phy(struct max_des *des, 
struct max_des_phy *phy)
                  */

                 if (priv->info->polarity_on_physical_lanes)
-                       map = phy->mipi.data_lanes[i];
+                       map = phy->mipi.data_lanes[i] - 1;
                 else
                         map = i;

data_lanes is 1-based (since 0 is the clock lane), but the bits
in register 0x335 start from 0. That means we should adjust the
values in data_lanes to be 0-based.

> Only after mentioned change we managed to get the video stream.
> 
>  > This should already be implemented by using different numbers in
>  > data-lanes property in devicetree.
> 
> Awesome, this will come in handy for sure.
> 

