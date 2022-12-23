Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820778476
	for <linux-staging@lists.linux.dev>; Fri, 23 Dec 2022 13:18:54 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id v11so4967303ljk.12
        for <linux-staging@lists.linux.dev>; Fri, 23 Dec 2022 05:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4mlEgcwFdImzUImTWxnNI1/88SYWLsS4X9m2YOU33c=;
        b=irPSz7ia6eybf0/tMnpqcBla8RCDVig3aIFF82ZeqKhARJHKQ/2LAeh7AdG7Pthvzb
         LTNUbdPd+mLBvv0s8RNwIC4Y+nBsDU7iTFEVbhx8vvWK51jxb+cq8b3ZpAttgVV+hTVB
         jIWJwvYAQNIj+6KEo/h4XE8mt8DZWHJ2PB8MGCxqFyKLFZaXp4/hgYzuOFH6REgaVTaK
         /paTuRLSgreuM8GqA56n0CwF7noekoO+IuaoZI6BGTWqtlqaXyGQi7KE/VQ/mKoeesKW
         wlwyXLRNnCCkqnm6KxVPhusmhBvTgXmO1Rm83hi+JeQfBxNWp+Vq85kfCW54xpKWnxzc
         m0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4mlEgcwFdImzUImTWxnNI1/88SYWLsS4X9m2YOU33c=;
        b=0k4Gzrn5EbFSZ7IqKpUZN+Gbrk5G+BU55Z99KQgzl0SG0tf2/Gt3HIz+LsDixk+g2r
         /+44ARd8LshL5aI13DdheVLF7TJhm5i0u+e3rfm+F9zRj9g9ZjOYYxTJG+KulXOakkUL
         KAWDTV3qPhf4DfHnYoAhLP2w0C/XDgQb1ZNosvSy23SacD/ZufSeAIlDW+tK2AaHFAzc
         ecPrqUXip/tBb92XZ9RJNkACxdXUP7yXJVxtE2yWIu8Dtc6/CQUsgFnUdr7XsmYCJ98q
         hqal7L323qsZ3Tw/6zfm/8vubc9PKmvlDBmXBh4OJhcu8WpnCA9bWartQ6/FqoZMoupx
         P0nQ==
X-Gm-Message-State: AFqh2krOg7sRuG4qSAJd1WEMplkEDGNYLLSoh3mBm+zmIPI3Mhj9Mblb
	beS16du/NXqJ+bowo64yxEc=
X-Google-Smtp-Source: AMrXdXuLIQTWWRW/U0cNPGZVwIvRO7tNjx1K1KWmcP/mkV18GGfRGvHxxTf/hPx90vqa1T9r1U/PqA==
X-Received: by 2002:a2e:97d4:0:b0:279:bbe1:72e1 with SMTP id m20-20020a2e97d4000000b00279bbe172e1mr2592237ljj.18.1671801532634;
        Fri, 23 Dec 2022 05:18:52 -0800 (PST)
Received: from [192.168.2.145] (109-252-113-89.nat.spd-mgts.ru. [109.252.113.89])
        by smtp.googlemail.com with ESMTPSA id u22-20020a2eb816000000b00279f302f652sm422715ljo.111.2022.12.23.05.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 05:18:52 -0800 (PST)
Message-ID: <6098882c-76f5-cdfc-0614-4d3657f598c2@gmail.com>
Date: Fri, 23 Dec 2022 16:18:51 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 21/21] staging: media: tegra-video: add tegra20 variant
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-22-luca.ceresoli@bootlin.com>
 <3c32ee42-2b75-ba16-dcd0-d12acd87b47f@gmail.com>
In-Reply-To: <3c32ee42-2b75-ba16-dcd0-d12acd87b47f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

23.12.2022 16:02, Dmitry Osipenko пишет:
> 28.11.2022 18:23, Luca Ceresoli пишет:
>> +static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
>> +{
>> +	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
>> +	int width  = vi_chan->format.width;
>> +	int height = vi_chan->format.height;
>> +
>> +	unsigned int main_input_format;
>> +	unsigned int yuv_input_format;
>> +
>> +	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_format);
>> +
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
>> +
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_INPUT_CONTROL,
>> +			 VI_INPUT_VIP_INPUT_ENABLE | main_input_format | yuv_input_format);
>> +
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, 0);
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, 0);
>> +
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_VIP_V_ACTIVE, height << VI_VIP_V_ACTIVE_PERIOD_SFT);
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_VIP_H_ACTIVE,
>> +			 roundup(width, 2) << VI_VIP_H_ACTIVE_PERIOD_SFT);
>> +
>> +	/*
>> +	 * For VIP, D9..D2 is mapped to the video decoder's P7..P0.
>> +	 * Disable/mask out the other Dn wires. When not in BT656
>> +	 * mode we also need the V/H sync.
>> +	 */
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INPUT_ENABLE,
>> +			 GENMASK(9, 2) << VI_PIN_INPUT_VD_SFT |
>> +			 VI_PIN_INPUT_HSYNC | VI_PIN_INPUT_VSYNC);
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_DATA_INPUT_CONTROL,
>> +			 GENMASK(9, 2) << VI_DATA_INPUT_SFT);
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INVERSION, 0);
>> +
>> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT_1,
>> +			 VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT |
>> +			 host1x_syncpt_id(vi_chan->out_sp) << VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT);
> 
> Wondering whether you also need to set up the sypct_incr condition to
> op_done, it should be immediate by default. I see that T210 VI code sets
> up the incr condition.

Found in the doc "Continuous syncpt always use OP_DONE as condition",
the current code is fine.
