Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43710179A7
	for <linux-staging@lists.linux.dev>; Tue,  6 May 2025 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558116; cv=none; b=pcpKojIU55a4eJrLAkuhpLFA8rBUQIOWxjPqxxdyq4B/O+CGY71GbwcTiZCzW4gDY+VEYxkR59i0AG9IRRWDG18Zqh27JzegQy/uxNKmiG5rfCXIsu7Ca+5Qvo4nQ/MhxCzXLJ5DXLtE3DsZpZ3bvA/3ehUoHd25CujjZCmPcQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558116; c=relaxed/simple;
	bh=VhezuHT/cXWGlna450cAfGgZoaiiSyYXiqcDWVWAW1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVn3fQ9nv2a3xZrwLIxoojE6jaum+amFaXMCm/2tzJLUnAYXx3mp+nAD1XazBXgy4ZONMaWkekHcTkqXm3DhLmja1hE75SCK/EL0pjXfe5GJmpts415lgvF2lT4zDLBtzWs7Z405f7q0nVFCczoYaN4lb8Yy+OU90/TKfwG4OYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjW3nhnt; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjW3nhnt"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso8968985a12.1
        for <linux-staging@lists.linux.dev>; Tue, 06 May 2025 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746558112; x=1747162912; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voBatGCVFVnkbsMGsX4/DSvQd0vsnFHO73aDqPhkgTM=;
        b=LjW3nhntLR5L1yhJtMWbsyrpK1np6zig4ZS2KAWViZtNk/P2Y3MJKZBv+Dh+BbYBSi
         NzcmAyGKJv9+3kI8PXUWmQVUkupF9Pc7TEXbXTqQupoU+08JU9D9HBPuFs3Gd2QdRC3u
         kapEeUQVSIadN0mgAC8EbPqVhMPPrY7xtR4ZkmT0UMAS0Qd7h4lK5uCXrRcaxAcsYjNb
         QkDnoGqnA+1G/vAvVgff+HzlBfRFtxgwCV9fK21jBTAO3H6on0r/xonJveh6w04MgHvS
         P9rQoU8tijIBIjOpnK+dFbCSTxXfV6/AOcbVbeQGslQAMrSCL6BzpRDar9jvehYBiqLo
         UtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746558112; x=1747162912;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=voBatGCVFVnkbsMGsX4/DSvQd0vsnFHO73aDqPhkgTM=;
        b=Vj9bQq16lP18fnLpLZnWTFuAUBI1jtwGu/H8n2v+IlB2CiAio3B4B2lZlihi8GMR+j
         Ex+DiYA4t4po3bhPlb/tc7/YQ0Vjf2DQ7JAT5lXN+b0jwBe6uT9/q06wzYBLtoOywW4D
         r8A+8xEsgy30kx7cu6+osVBqPTCHs4fftnEaWrleOu29yfiSi+KC0vJlUv6AjWMwFMN1
         zOL+ixU8ITh9GV3kiWwE5ptCxSfWF64y7fudR/JAZy8lQc31D1/sAoYD7IheZVn2NLCd
         E3/dpOk8vn6zvrZPxiZWs66Kp190EEwHt6EXYBw9KXxN/LPUZqbeHZMoTVoS2td2GgpK
         pPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUKinlSDArAMdv7i7UeVKu1MjOmiE36v2kPW08MSCUtjxUbeX5aFGKTzfAfUhQlPfW/8qhBjPKNnRtUUOx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx65lakPf8A4h3TW7SSDtspIsFYV2DxIy6QqzVsETH1jErPMkA6
	cM6U8bCRCOdXP6qJ+7FN3PLzWlkHnTW65bhz9iLQ0oY5TryXFdSP
X-Gm-Gg: ASbGncskeUMQMNkhunFeun4jPL9sxuEY18YpQUm2qgHqun+1Jc9NCYyx5Ha8uFEmZwm
	OrPu/mShl53ZqCTcV7EFFObE4YDV9VSFKwkzuPDDdgstIXyFTtqX3NFIPjL7lpvVbjrvqWfyu1m
	icbeXhjY6a1XaqOe92vqGd8aK7JStKtGqFPsh7UeeiX87Z8tXnGTjGZEEsIekZt/hsEOB8ZpbsS
	uNPMs48ZMLeYmPU/gUf0c6m+RwvUdMPsbh2UTp+2IvLCwS/dJmONN+9NEViTTiI/O1OTF4ud8Mv
	qscTnh0Q0siraKuAC/901QLAksGCrrLLfsDYv0a+W4XojQ==
X-Google-Smtp-Source: AGHT+IFWEXs3lgGVsw8JtDGd7ANyYp0zdsacD9hO6mvpw5fW/FuafssUE5pgzZvlYTNbTtqLhfLFDw==
X-Received: by 2002:a17:907:1b05:b0:ac7:e815:6e12 with SMTP id a640c23a62f3a-ad1e8c662f9mr60826966b.33.1746558112095;
        Tue, 06 May 2025 12:01:52 -0700 (PDT)
Received: from [192.168.0.100] ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1895087d1sm752900066b.128.2025.05.06.12.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:01:51 -0700 (PDT)
Message-ID: <f22f1343-9b7b-4ae6-9461-bc1b8108619f@gmail.com>
Date: Tue, 6 May 2025 22:01:46 +0300
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
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <b214bf8d-33d0-4da8-bf16-cc62bd1fbd55@videtronic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/6/25 9:33 PM, Jakub Kostiw wrote:
> Hi Cosmin
> 
> Awesome work. The initiative to establish a common framework for GMSL 
> devices is a great idea.
> 

Hi! Thanks for the feedback.

> I believe that we have found few bugs:
> 
>> +#define MAX9296A_BACKTOP22(x)            (0x31d * (x) * 0x3)
> 
> The first multiplication is wrong and should be replaced with addition:
> 
> +#define MAX9296A_BACKTOP22(x)            (0x31d + (x) * 0x3)
> 

I'm aware of this issue and had it fixed locally, just haven't submitted
a new version yet.

> The same goes for MAX96724 equivalent macro:
> 
>> +#define MAX96724_BACKTOP22(x)            (0x415 * (x) * 0x3)
> 

Although I haven't noticed that it applied to MAX96724 too, thanks.

> In MAX96714 driver there is an issue with setting up lane-polarities.
> 
>> +static const struct max9296a_chip_info max96714_info = {
>> +    .max_register = 0x5011,
>> +    .set_pipe_stream_id = max96714_set_pipe_stream_id,
>> +    .set_pipe_enable = max96714_set_pipe_enable,
>> +    .set_pipe_tunnel_enable = max96714_set_pipe_tunnel_enable,
>> +    .phys_configs = {
>> +        .num_configs = ARRAY_SIZE(max96714_phys_configs),
>> +        .configs = max96714_phys_configs,
>> +    },
>> +    .polarity_on_physical_lanes = true,
>> +    .supports_phy_log = true,
>> +    .adjust_rlms = true,
>> +    .num_pipes = 1,
>> +    .pipe_hw_ids = { 1 },
>> +    .num_phys = 1,
>> +    .phy_hw_ids = { 1 },
>> +    .num_links = 1,
>> +};
> 
> In order to make thing work we had to set
> 
>> +    .polarity_on_physical_lanes = true,
> 
> To false. So this field is either improperly set for MAX96714, or 
> handling of this case is wrong:
> 
>> +        if (priv->info->polarity_on_physical_lanes)
>> +            map = phy->mipi.data_lanes[i];
>> +        else
>> +            map = i;
> 

MAX96714 has different value meanings for the polarity register
(compared to MAX9296A). On MAX96714, the bits represent the
polarity of the hardware lane (not taking mapping into account).
On MAX9296A, mapping is taken into account by hardware, so
the polarity can be retrieved directly. See the comments surrounding
that piece of code. It's entirely possible that I was wrong when
writing this code, but this was cross-checked with the datasheet
and the GMSL SerDes GUI. It's not out of the question that any of
these could be wrong.

Are you setting a specific polarity on the lanes? I've validated
MAX96714 (after the upstream submission) myself and it works.

> Upon mentioned changes we have successfully tested two GMSL2 
> combinations on Raspberry 5 platform:
> 
> 1. MAX96724 + MAX96717 (only 2 MIPI-CSI2 lanes with single camera due to 
> hardware limitations)
> 
> 2. MAX96714 + MAX96717
> 
> We have also been wondering about these registers:
> 
>> +#define MAX9296A_DPLL_0(x)            (0x1c00 + ((x) == 0 ? 1 : 2) * 
>> 0x100)
>> +#define MAX96724_DPLL_0(x)            (0x1c00 + (x) * 0x100)
> 
> There are writes to these addresses but we could not find any reference 
> to these in either MAX96714 or MAX96724 datasheets.
> 

These registers are not mentioned in the datasheet of MAX96714 or
MAX96724, as they're considered "hidden". You can look at MAX96716A
datasheet for a description.

> Are You willing to add support for mapping MIPI-CSI2 lanes? This is a 
> very convenient feature which comes in handy during HW design.
> 

This should already be implemented by using different numbers in
data-lanes property in devicetree.

