Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8FC1078A
	for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685202862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fWXtfOd6tHgSzxnVv5n9Y7UKxxqVFWTdpkSovEPASQM=;
	b=PtyFH8MHxqQzsjhw7zW+XBdbJs3D4Dr8azB8mmiqoRBu8/mCoWIzMu9+8+qtuqe+iPjKbH
	6oLvbp26BlFkbcqV9ePlsTihwDVdqOVr+k3UcMBI+TcOJUysFjkBu5TV61Be8bJS95xaBk
	p/uyj1GIC7wsdhr8WBLPYtM/I6OBmms=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-TmevXsNXPVOwUQ6rp09Hsg-1; Sat, 27 May 2023 11:54:21 -0400
X-MC-Unique: TmevXsNXPVOwUQ6rp09Hsg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-96fb396ee3dso160224166b.1
        for <linux-staging@lists.linux.dev>; Sat, 27 May 2023 08:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685202860; x=1687794860;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fWXtfOd6tHgSzxnVv5n9Y7UKxxqVFWTdpkSovEPASQM=;
        b=ODwkYtJtP1IRaK3sTPCWOGzcqOLk5tAGoEacGkynl+Y4X89g7zebpGzN+3hGiw9lvc
         nFBxiJv3xbPhYzqmZp+Uf/MFT74sF7tMzugJ4CcXnJJjGSrxw/IMd4uO+nw8LzrHviUS
         MBtH8GxaZzsRO781VCyz4d5fdQytyZ+wtjb33PXnU44zyL1l9+1Z4ukXvKaR8zwLb8Pf
         skrkfMaSJ1e7Wy1ED6gYyLRCluy4yMVlnP/sB6j70JVtcz/azPj/jw/lwof4edmQMh4C
         dqP/ED+fyvSpnbMg3GtR6GkY0X0kTZvfbGc0Rpl1rraJjXwTy28F+tydiZsUhjf5EtPS
         bNEA==
X-Gm-Message-State: AC+VfDxJnhLtAv3RMED3IJulRK1tDiSPnw69C4Bhb0wpgZ9cR/jnG4hG
	7RqnTjjV+cvJcPCCy/BwHsTIR3wSTC8TJHUbbspCJ2sS+2hYs1tR6let7cpnOiNqZgqUa64GzUA
	j+cMV/Xdfp1tYFcwsURnVNd0H1w==
X-Received: by 2002:a17:907:2d13:b0:973:ea41:3ef8 with SMTP id gs19-20020a1709072d1300b00973ea413ef8mr933668ejc.35.1685202859972;
        Sat, 27 May 2023 08:54:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7eH60rbebjGc335e2DNtNerJIO7a+02d1+rpBt5qPcbPCJMB3TqCXK2upgb/UGhhxvbcZb/Q==
X-Received: by 2002:a17:907:2d13:b0:973:ea41:3ef8 with SMTP id gs19-20020a1709072d1300b00973ea413ef8mr933659ejc.35.1685202859656;
        Sat, 27 May 2023 08:54:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z2-20020a170906074200b0096f4c9ce526sm3577411ejb.225.2023.05.27.08.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 08:54:19 -0700 (PDT)
Message-ID: <5dd589f7-d0a7-f453-6835-227013db09fd@redhat.com>
Date: Sat, 27 May 2023 17:54:18 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/5] media: atomisp: Add support for v4l2-async sensor
 registration
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 Dan Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20230525190100.130010-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230525190100.130010-1-hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 5/25/23 21:00, Hans de Goede wrote:
> Hi All,
> 
> Here is a new version of my v4l2-async sensor registration support
> for atomisp. I have merged all the prep / cleanup patches which Andy
> already gave his Reviewed-by for in my media-atomisp branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
> 
> This v2 series applies on top of that branch!
> 
> This v2 series is the remainder (and core part) of
> my previous 2 related patch-series:
> 
> https://lore.kernel.org/linux-media/20230518153733.195306-1-hdegoede@redhat.com/
> https://lore.kernel.org/linux-media/20230518153214.194976-1-hdegoede@redhat.com/
> 
> The big change in this v2 is making atomisp_csi2_bridge_init() also
> add the ACPI GPIO mappings to the sensors it finds / it is adding
> fwnode graph endpoints for. Combined with making sensor drivers
> check there is a fwnode graph endpoint (and return -EPROBE_DEFER if not)
> before trying to get GPIOs so that the mappings are in place before
> getting the GPIOs.
> 
> Thank you Sakari for suggesting this nice solution.
> 
> Patch 1    Adds the v4l2-async sensor registration support
> Patch 2-3  Convert the ov2680 and gc0310 drivers to this
> Patch 4    Removes some now dead code
> Patch 5    Moves the now fully standard / no custom atomisp API
>            gc0310 sensor driver to drivers/media/i2c
> 
> Patches 1-4 only touch atomisp code and build on top of previous
> work so I plan to merge these through my media-atomisp branch.

I have pushed patches 1-4 to my media-atomisp branch now with
Andy's Reviewed-by added (and with Andy's review remarks addressed).

> Patch 5 also depends on all the others, so it should also
> get merged through my media-atomisp branch. Sakari may I have
> your Ack for this ?  Alternatively we could delay the move to
> the next kernel cycle and then it could be merged directly
> into some other linux-media branch. Either way works for me.

How to merge patch 5/5 moving the gc0310 driver from staging
to drivers/media/i2c is still something which needs to be
decided...

Regards,

Hans


