Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2A3EC2EF
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154634; cv=pass; b=ncfrN9vS+gKZpKSEklYm4UhITbiPuGOBIsmPhwF2G0/qTclcV0GBP3py1934nZ0XUWu5b0q5xobWOhLUlsdPNyf+36B6HWquOulL/wG5QSjaNXWtEwqUUopMTt+fnnqnrx9JNaTaBg2+L9y1zxNBdgeSASxh2IbfpcvWiinZptI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154634; c=relaxed/simple;
	bh=hJUpkJFy4pFgHUpAc4l5g4rVqSQXJgujCikzsRw1LI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UL/jHQuDIadQm1vB0WjWqscHGDfOXawVo2jvBbLMFZYPZ7FyyeAL0w6rao05SXyOE2DtA6LoJHR+U+20++AqHTYgSoOymNtx0zLBQ1HOY8sqeY+PAr46AlGLXBMFT1DEcnp1r1jXarnwFYQXzQSfLj5gPNxbJXWYVUHsSm70PKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai; spf=none smtp.mailfrom=edgeble.ai; dkim=pass (2048-bit key) header.d=edgeble-ai.20251104.gappssmtp.com header.i=@edgeble-ai.20251104.gappssmtp.com header.b=iQ2LGvp0; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=edgeble.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=edgeble-ai.20251104.gappssmtp.com header.i=@edgeble-ai.20251104.gappssmtp.com header.b="iQ2LGvp0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2babfd18435so2874425ad.1
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 04:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778154632; cv=none;
        d=google.com; s=arc-20240605;
        b=LG4lApbjLPfLjrp2dDo7KZWRFsfrWT/bfnomMSzmPBp6mPUNDTpqgk/BIZpT4xZsAz
         UCtK3naqT7ZqtIvSAHbwwvRcz7w7/N5TqryW/3rp69tB8DT/0auxNPL4gjRYJIjmFfH0
         kWppTQmh+D7pquzBvvB5cim4ojYsHoQHLXvkKKAobvWKjpiKzsZfcNC5ouYfBnAa9QqP
         RsPOFvzTA9/cGWMfFb2iI9hih3RmQjXR6Zp7DQeBjCFNIV9+bgi91kCGHjLbI0YtvrJU
         pJ8V6DDfMUbI6ea4idRRqXcB5qSUPa3BErFL+hf6SZDA7NQQIzZngExVzerBOaX6EfNB
         gNRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        fh=yEr5mAi8BdSqS9wopLaX61ATdLqzb+N1fBOMHyP7tf8=;
        b=AEGoo5whhtWOTs7AVufuFyUtZ/q167kBqARw8ldXIHgQX18H0K3KSNic6jzivaQbZN
         vrbWc6/YxEI/n9bgW4vRXsEZfMRFh9oKGoaKGuPZpDbZm1tjQp+r2Mvgx16DSS98HkG7
         ffaFuz7PZ01/Xrms8P5LKy6Yfuf+DgDijZOjt1ToqCq3NYPPPap4eIXE8Col0k0jrP/3
         APfERDOJBN0+5YFVdydtRTBPldwOoibmdLbqk1fNRxpX25H8zfDbiyrl1IlsddQuxbqc
         wrilUXmyISeuagSitP7WQ2rvp0/j5aHg/E0FCxtfHwLGpHl4crSYDP0ZbQA6mSsLnYXQ
         TyBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20251104.gappssmtp.com; s=20251104; t=1778154632; x=1778759432; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        b=iQ2LGvp0kPzYLcRdILVoqPApZ5baMw+RQNxs+n7/d+VGNtJuaeA8gZKHgcGeK+TgPD
         qAEcIVrEEDIGdl8YO8NW026jGMRjVU9EXAdNoC7l1KsNBaFQW3ICLr0unZDlXnNoOeTv
         AXbLGJsc6ZK/rShDMOKy+NdYv+DGN0moWORLPLBiOvCHq2gKdjVOl4p4JRQkeZpVayO/
         KPGDybXnKjxkU5Sk+tu5SjqItsVyO8YU7l1gcp860/4uXJXlwU+vhfn2u4SfQZdYffvu
         PWp+6U74ddoBcpLRvd98XsRUjHKY7xztYN1VidCM/MjVF2ghjGd4W6FfgPHspuXwbJ5I
         6CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154632; x=1778759432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvJ38BsT9fMouXvjyZnoiUSCRKuA5x8AFeU1cGImlEE=;
        b=ipRC3HjqaVPSp42fvRKfDUIWwCzGZygGavzQdb5jayHF4kVhHx6PfJ7EySfoZS1yjD
         xfO16B4hhs1gHMfL6WxK5m9sC2LijsZmqohG7nIF5M+iGLQgZVWNeplgCet6aM7h68Uv
         fYPq4uIkcJEnoveY3rgtOhn6G+B4EHnbC8POLJQVxsNbU50ueegxaGgFHIIoYt7ll1Mi
         7tfXD5go1aZclvzhyEp78TA15uUnNweA0ckE6lHRnyuazO/lue3X2jifReVU1npDbzdU
         7RV/CX/zlpiMuXedbJTeXwDtFXn8L1LbVQR+O4VOTM78vJzixzr2pDCoQSPjXqY0DxP7
         73fA==
X-Forwarded-Encrypted: i=1; AFNElJ+BLOXZEgOciBIPPLOVRcq/tc8McqJQPGaIYpPZaBSo0wvChrxgEjkQnyMPacqnsCWUUyqukUpVcU4W5UAG@lists.linux.dev
X-Gm-Message-State: AOJu0YwNOAaIloAP9AS+Um2PRZXm2rFdWxle/nut2MZcy7uhZg652Qu8
	6Nk2oC1g4h/1006XbJDs47DfjFLYMl6c4N6TTJq4rmsbVGnIEl1bga7LDePrti4wiplaL8cGogj
	p20OinYCgfj+j42FEuwmWSqieFx59FxIVJkiapgaoBQ==
X-Gm-Gg: AeBDies98XLR2p/ABsvNoQGRn1L/lb3P9JD+Z9nUvUa8gs81YOX8EzZrfzDxuis4fXO
	PUVyzx06yU2jWA1vRadf16lrOnSKKeDCENbtsdLvHD2xuN3Y+H2R5Afp3n2/MlInWtdr2SO5px3
	Mr69kSK++CqwWNmtmaA1YpMz7HIcLvY/9t0Z7b1D0Bj9iP0uHEgrpUyhwD4V/66V8/UuYPJBAmk
	g2k2JSi2Ok0mn4Zn3uD1kl/VEELtvszy3Fhd4nEiqAfCH9Gz+p3+JIwmi5ZmdiovawgI74TizW3
	kPRNHy8f1x2rYfONceuV5BQSMdoFXwEFmjNKLAi3mWb5SwkfztAMylJi7+DkdAhqbsjUPUQ15ZB
	KUamsUMdegxrl3KIHUKc085Ldy24k5kjoCfGabc9pO9VwgQZ4fO4BRKmNcA1U6mEBj9/lyl/dAe
	jzU1Rq
X-Received: by 2002:a17:903:32d0:b0:2ad:9b86:ddc2 with SMTP id
 d9443c01a7336-2ba79287840mr74956165ad.22.1778154631740; Thu, 07 May 2026
 04:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
In-Reply-To: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
From: Jagan Teki <jagan@edgeble.ai>
Date: Thu, 7 May 2026 17:20:18 +0530
X-Gm-Features: AVHnY4ImNfDSCtiszfUjpZiS_xnG2D7LfpDRWViLHXt-m2rR-PMYp3ZtRPQUAUI
Message-ID: <CA+VMnFwV6gH+W=5UdpPJ2t8J=C0hpZ8M_gmKok_DpmCkJOWo=g@mail.gmail.com>
Subject: Re: [PATCH v10 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Apr 2026 at 01:47, Dumitru Ceclan via B4 Relay
<devnull+dumitru.ceclan.analog.com@kernel.org> wrote:
>
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
>
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
>
> This series depends on support for internal pads, for which a patch has
> been added.
>
> The previous version is at:
> v9: https://lore.kernel.org/r/20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com
>
> Since the previous series, Cosmin has left Analog Devices.
> Because included changes from previous version are trivial, his sign-off
> and tags were retained.
>
> The following deserializers are supported:
> * MAX96712 (already exists in staging)
> * MAX96714 (already exists)
> * MAX96714F (already exists)
> * MAX96714R (GMSL2)
> * MAX96716 (GMSL2)
> * MAX96724 (already exists as part of existing MAX96712 driver)
> * MAX96724F (GMSL2)
> * MAX96724R (GMSL2)
> * MAX9296A (GMSL2)
> * MAX96792A (GMSL3)
>
> The following serializers are supported:
> * MAX96717 (already exists)
> * MAX9295A (GMSL2)
> * MAX96793 (GMSL3)
>
> The following list enumerates new features that are supported by the
> common framework and their respective chip-specific drivers:
> * Full Streams API support. Most deserializers have support for more
> than one link, and more than one PHY. Streams support allows
> configuration of routing between these links and PHYs.
>
> * .get_frame_desc() support. Both the serializers and deserializers
> implement this to query and provide frame descriptor data. This is
> used in features explained in-depth below.
>
> * .get_mbus_config() support. The deserializers implement this to allow
> upstream devices to query the link frequency of its pads.
>
> * Address translation with I2C ATR for the serializers.
>
> * I2C ATR translation - some deserializers cannot do muxing since I2C
> communication channel masking is not available per-link, and the only
> other way to select links is to turn them off, causing link resets.
> For such cases, I2C ATR is used to change the address of the
> serializers at probe time.
>
> * Automatic GMSL link version negotiation between GMSL3, GMSL2 6Gbps, GMSL2
> 3Gbps.
>
> * Automatic stream id selection for deserializers which need serializers to
> stream on unique stream ids.
>
> * Automatic VC remapping on the deserializers. VCs are picked so that
> if they were unique on the sink pad, they will end up as unique on
> the source pad they are routed to too, prioritizing using the same
> VC ID as the sink pad, to facilitate the possibility of using tunnel
> mode.
>
> * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
> when VC IDs do not need to be changed and all hardware supports
> tunnel mode, otherwise, pixel mode is used. The serializers are
> automatically switched between the two by using a private API.
>
> * Automatic double mode selection. In pixel mode, double mode can be
> used to pack two pixels into a single data unit, optimizing bandwidth
> usage. The serializers are automatically set up to support the double
> modes determined by the deserializers using a private API.
>
> * Automatic data padding. In pixel mode, if the data being transferred
> uses two different BPPs, data needs to be padded. The serializers
> automatically set this up depending on the configured double mode
> settings and incoming data types.
>
> * Logging. Both the deserializers and serializers implement the V4L2
> .log_status() ops to allow debugging of the internal state and
> important chip status registers.
>
> * PHY modes. Deserializer chips commonly have more than a single PHY.
> The firmware ports are parsed to determine the modes in which to
> configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
> fewer lanes).
>
> * Serializer pinctrl. Serializers implement pinctrl to allow setting
> configs which would otherwise be inaccessible through GPIO: TX/RX via
> GMSL link, pull-up & pull-down (with strength), open-drain &
> push-pull, slew rate, RCLK pin selection.
>
> * TPG with selectable formats, resolutions and framerates for both
> serializers and deserializers.
>
> The drivers have been tested on the following hardware combinations, but
> further testing is welcome to ensure no / minimal breakage:
> * Raspberry Pi 5 + MAX9296A + 2xMAX96717 + 2xIMX219
> * Raspberry Pi 5 + MAX96714 + 1xMAX96717 + 1xIMX219

Thanks for the series. For validation, could you share the DT binding
used while testing this configuration (Raspberry Pi 5 + MAX96714 +
1xMAX96717 + 1xIMX219)?

I used the same with imx415 but, cannot detect the sensor ID.

[   12.768891] max9296a 7-004c: DT source ports parsed
[   12.768903] max9296a 7-004c: DT physical configuration selected: 0
[   12.768909] max9296a 7-004c: DT pipe defaults initialized
[   12.768919] max9296a 7-004c: DT sink port 0 present
[   12.768926] max9296a 7-004c: Looking up port0-poc-supply from device tree
[   12.768978] max9296a 7-004c: DT sink port 0 enabled
[   12.768989] max9296a 7-004c: DT sink ports parsed
[   12.768995] max9296a 7-004c: Initializing deserializer core
[   12.769000] max9296a 7-004c: Applying RLMS adjust sequence (2 regs)
[   12.770660] max9296a 7-004c: Enabled link A remote control channel
[   12.771745] max9296a 7-004c: Enabled on-die LDO2
[   12.771755] max9296a 7-004c: Skipping TPG init for this variant
[   12.771762] max9296a 7-004c: Disabling deserializer output during init
[   12.793066] max9296a 7-004c: Link 0 serializer xlate start:
power-up 0x42 alias 0x40
[   12.793081] max9296a 7-004c: Selecting links mask 0x1
[   12.796294] max9296a 7-004c: Selected links mask 0x1, waiting for settle
[   13.108806] max9296a 7-004c: Link 0 serializer responded at 0x40 before reset
[   13.216637] max9296a 7-004c: Link 0 serializer xlate complete: 0x42 -> 0x40
[   13.216817] max9296a 7-004c: Selecting links mask 0x1
[   13.219683] max9296a 7-004c: Selected links mask 0x1, waiting for settle
[   13.425486] max9296a 7-004c: Consider updating driver max9296a to
match on endpoints
[   13.425503] rockchip-csi2-dphy csi2-dcphy0: dphy0 matches max9296a
7-004c:bus type 5
[   13.499022] max96717 10-0042: Allocated serializer core state
[   13.499081] max96717 10-0042: Parsed serializer DT
[   13.524495] max96717 10-0042: Initialized serializer core state
[   13.524511] max96717 10-0042: Initializing serializer i2c-atr adapter
[   13.527562] max96717 10-0042: Initialized serializer child I2C adapter
[   13.527587] max96717 10-0042: Registering serializer notifier
[   13.527598] max96717 10-0042: Added serializer source notifier for phy 0
[   13.527607] max96717 10-0042: Registered serializer notifier
[   13.527619] max96717 10-0042: Consider updating driver max96717 to
match on endpoints
[   13.527635] max96717 10-0042: Registered serializer V4L2 subdevice
[   13.540303] imx415 11-0037: detect imx415 lane 4
[   13.540310] imx415 11-0037: current mode 2, cfg_num 12
[   13.540356] imx415 11-0037: Failed to get reset-gpios
[   13.540369] imx415 11-0037: Failed to get power-gpios
[   13.540377] imx415 11-0037: no pinctrl
[   13.540385] imx415 11-0037: Looking up dvdd-supply from device tree
[   13.540450] imx415 11-0037: Looking up dovdd-supply from device tree
[   13.540495] imx415 11-0037: Looking up avdd-supply from device tree
[   13.580898] imx415 11-0037: Requested xvclk=24000000 actual=24000000
[   13.630800] imx415 11-0037: Read chip ID reg 0x311a = 0x00 (ret=0)
[   13.630815] imx415 11-0037: Sensor state: 0x3000=0x00 0x3001=0x00
0x311b=0x00 0x311c=0x00 0x311d=0x00
[   13.630825] imx415 11-0037: Unexpected sensor id(000000), ret(0)

DT:
&i2c7 {
    #address-cells = <1>;
    #size-cells = <0>;
    status = "okay";

    max96718_dcphy0: deserializer@4c {
        compatible = "maxim,max96718";
        reg = <0x4c>;

        port0-poc-supply = <&vcc_3v3_adapter>;
        i2c-alias-pool = <0x40>;

        ports {
            #address-cells = <1>;
            #size-cells = <0>;

            port@0 {
                reg = <0>;

                max96718_link0_in: endpoint {
                    remote-endpoint = <&max96717_gmsl_out>;
                };
            };

            port@2 {
                reg = <2>;

                max96718_csi_out: endpoint {
                    remote-endpoint = <&mipidcphy0_in>;
                    data-lanes = <1 2 3 4>;
                    link-frequencies = /bits/ 64 <400000000>;
                };
            };
        };

        i2c-atr {
            #address-cells = <1>;
            #size-cells = <0>;

            i2c@0 {
                #address-cells = <1>;
                #size-cells = <0>;
                reg = <0>;

                max96717_0: serializer@42 {
                    compatible = "maxim,max96717f";
                    reg = <0x42>;
                    gpio-controller;
                    #gpio-cells = <2>;
                    #clock-cells = <0>;
                    i2c-alias-pool = <0x11 0x12>;
                    pinctrl-names = "default";
                    pinctrl-0 = <&max96717_0_pwen_pins
&max96717_0_rclkout_pins>;

                    max96717_0_pwen_pins: pwen-pins {
                        function = "gpio";
                        pins = "mfp0";
                        drive-push-pull;
                        bias-disable;
                        output-high;
                    };

                    max96717_0_rclkout_pins: rclkout-pins {
                        function = "rclkout";
                        pins = "mfp4";
                    };

                    ports {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        port@0 {
                            reg = <0>;

                            max96717_csi_in: endpoint {
                                remote-endpoint = <&imx415_0_out0>;
                                data-lanes = <1 2 3 4>;
                            };
                        };

                        port@1 {
                            reg = <1>;

                            max96717_gmsl_out: endpoint {
                                remote-endpoint = <&max96718_link0_in>;
                            };
                        };
                    };

                    i2c-atr {
                        #address-cells = <1>;
                        #size-cells = <0>;

                        i2c@0 {
                            #address-cells = <1>;
                            #size-cells = <0>;
                            reg = <0>;

                            sensor@37 {
                                compatible = "sony,imx415";
                                reg = <0x37>;
                                rpi-global-reg-list;
                                clocks = <&max96717_0>;
                                clock-names = "xvclk";
                                avdd-supply = <&avdd_2v9_cam0>;
                                dovdd-supply = <&dovdd_1v8_cam0>;
                                dvdd-supply = <&dvdd_1v1_cam0>;

                                port {
                                    imx415_0_out0: endpoint {
                                        remote-endpoint = <&max96717_csi_in>;
                                        data-lanes = <1 2 3 4>;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};

Did I miss anything on the sensor side or in the DT?

Thanks,
Jagan.
