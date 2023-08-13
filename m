Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF4579DF
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691940618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KVrWFD8v3bwv2ACGGWu8o4gJmDRF+GmURj+vmIcVrOU=;
	b=d8iaoleRdoTUR+8p/GPgaOvkU9gOw217zeetdVLpCJBD6gS2N04NMLkbwq+TIYD5/TvsMn
	Jb9D/TdL2mSwYJAhLc5x6vuXo9147Au23WJTNRaUF8uOpyB70ulp1N0111uznPceiCWo/M
	GyzeP3dG+dZElbx2AXYdPEdSonsTNR8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-j9XW2OTZPTmV22HFkd8FwA-1; Sun, 13 Aug 2023 11:30:16 -0400
X-MC-Unique: j9XW2OTZPTmV22HFkd8FwA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-997c891a88dso239434566b.3
        for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 08:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691940615; x=1692545415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVrWFD8v3bwv2ACGGWu8o4gJmDRF+GmURj+vmIcVrOU=;
        b=HP9Qnv9z15eVksPcE3V51UIei97TPnXWdkXDqAVtCSl8Hsp+ui0sr8NBPuinQXjg+v
         td/UbjA/Merr6ZHBF//AMx5TO8wmzYBmsLWR5tX8i0slv1OIwgle9x/VWyMlmP2Z3I2r
         hVbOa3uQ0mh6ynNlhBxmp63Nf6ggPTLpXIi9keuZWU7430nzHJ2rIRsmLihrKwE3AJIb
         Hn5uMg4pUGycQ2GwGXT7D6QdkimIvuOma/eDDZNEw+yyLZ2jJREsRy+IH2j1mu9aihP9
         RRFH6KqDSa788fwvu48usRm2+xVdKkoyeCng0HENiCJp1fyhsGeqjzqvhYiIExMtWUz9
         ChCw==
X-Gm-Message-State: AOJu0Yyu48O5RaIzhgjmRq5rzso80fa3LU6Da0r88CoCqxuGdD0wUB+8
	SubvVifc4yoxeCyhz8I7zc+yqRzvvB/0Q7QLFojPkN3hpoBskdi1Az/LbQSDzFBH2mTOee5izoO
	lropK3NnNsK099mrIVOonKm3hgA==
X-Received: by 2002:a17:906:3284:b0:99c:570a:e23e with SMTP id 4-20020a170906328400b0099c570ae23emr6215100ejw.24.1691940615508;
        Sun, 13 Aug 2023 08:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIik3ZGvenTZOH6kovFW01OsGI5chXF71X2V0wVw5m5BTrkOxIU6EGdaDJf+9lprOCbypNLg==
X-Received: by 2002:a17:906:3284:b0:99c:570a:e23e with SMTP id 4-20020a170906328400b0099c570ae23emr6215085ejw.24.1691940615126;
        Sun, 13 Aug 2023 08:30:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w14-20020a1709060a0e00b0099b5a71b0bfsm4654052ejf.94.2023.08.13.08.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 08:30:14 -0700 (PDT)
Message-ID: <dc73e131-5779-613d-90ee-bdd3f7eccaac@redhat.com>
Date: Sun, 13 Aug 2023 17:30:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: atomisp: Disable VCM for OV5693 for now
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230813152645.45834-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230813152645.45834-1-hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/13/23 17:26, Hans de Goede wrote:
> ov5693 sensor modules have a VCM, but for unknown reasons
> the sensor fails to start streaming when instantiating
> a VCM i2c-client (and the runtime-pm link between VCM
> and sensor).
> 
> Disable the VCM for now, until this is resolved.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Note I have applied this series and 3 other pending atomisp patches from me to my media-atomisp branch now.

Sorry for not giving any time for review, but I believe these to be obviously correct (or at least the right thing to do for now for 1/2) and I'm preparing my media-atomisp branch to send a pull-req to Mauro for the upcoming 6.6 cycle.

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 03940c11505f..2483eaeeac73 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -521,7 +521,12 @@ static char *atomisp_csi2_get_vcm_type(struct acpi_device *adev)
>  }
>  
>  static const struct acpi_device_id atomisp_sensor_configs[] = {
> -	ATOMISP_SENSOR_CONFIG("INT33BE", 2, true),	/* OV5693 */
> +	/*
> +	 * FIXME ov5693 modules have a VCM, but for unknown reasons
> +	 * the sensor fails to start streaming when instantiating
> +	 * an i2c-client for the VCM, so it is disabled for now.
> +	 */
> +	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
>  	{}
>  };
>  

