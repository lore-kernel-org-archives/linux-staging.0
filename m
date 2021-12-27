Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B1168
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 17:48:58 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id x10so21444445oix.6
        for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pEDTSevr8Wui7/9Ib0ms0N7Elw3SuXo4ylecnWyhlSo=;
        b=ehv/beOOjVHY0/sgKdcpY8YzavbZDivcQVdBoIeoRKI4qC8EayE8VBARAwiSsJBeMg
         Zz3lXu+y9k2nNSuIlCNv/KXJeQUZt+jBe9GlImPC6RkELaI4OwGtotJ8lJT4/RYUvXeg
         5Yx++5EIDR1wB7QuoetS4tNem0svdSDSCecLUq4Nl5eBOUOKs2Gs+UisJK8zu7iYw2pq
         PcDsXaJJl8yT+sBrdf2ZMSprNPKxdo/1kTE/fvwlcME88l50Ds0vKqwzoH4bPkfvnAPw
         BW+JRWfrn/ItjQte78Dwgt8Dko2eYYW3nLA+EyqURprwTeFBH4+RkctBrk7LJGBiMFCC
         vwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pEDTSevr8Wui7/9Ib0ms0N7Elw3SuXo4ylecnWyhlSo=;
        b=6KQzniy2ePFxKFHbcp/5fJalkWrNzRbT2ISdiksktxeVn4XV8aFKBIqhM8/iGmbMZO
         hzQSWZIRwShIz3g5bgGAzuQi5kt+mf3x6dmaBGZdBN+EBgzcMm4tq49IBT7RAHzLofla
         MyOK8oQvNzVdyXwidaszd9aeyRETXgg7apFw9TOiU9Pg9an5WJKhuwvq7EdygF6wtv21
         kFG4HBoTdR1e6kdoq7zD4KpurSZNATkUADkQfYnu4jO+3kipQoddmQ0MC/3yLCY3Cc3A
         kaCrBqBJgVMQe+RMxsz0FfNDs6gjHe05fsAgVFpDj8yFt+LGOht/rGqbmKpBWzRpaxmB
         V3aQ==
X-Gm-Message-State: AOAM532omOlcrODQ9p3/ZE7pvKHttjD1eyuXLjl+k38VL15mrS/jCELT
	TUr0FjIGcrxv/lP2eMK9940=
X-Google-Smtp-Source: ABdhPJxb6+7biAtxOQefdtgXxvyx2b2YNDyhmSemqV7yYJxoDKcbxu7R4xufBgYDTWnPfrrEWMwb0g==
X-Received: by 2002:a05:6808:20a6:: with SMTP id s38mr14781112oiw.152.1640627337723;
        Mon, 27 Dec 2021 09:48:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 23sm2931424oty.6.2021.12.27.09.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Dec 2021 09:48:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann
 <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Karsten Keil <isdn@linux-pingi.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Jouni Malinen <j@w1.fi>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hannes Reinecke <hare@suse.com>, Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com,
 Mark Brown <broonie@kernel.org>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Forest Bond <forest@alittletooquiet.net>, Jiri Slaby <jirislaby@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-wireless@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-spi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <281298ec-3898-9b02-1d92-66bf6df41170@roeck-us.net>
Date: Mon, 27 Dec 2021 09:48:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211227164317.4146918-2-schnelle@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/27/21 8:42 AM, Niklas Schnelle wrote:
> Introduce a new LEGACY_PCI Kconfig option which gates support for legacy
> PCI devices including those attached to a PCI-to-PCI Express bridge and
> PCI Express devices using legacy I/O spaces. Note that this is different
> from non PCI uses of I/O ports such as by ACPI.
> 
> Add dependencies on LEGACY_PCI for all PCI drivers which only target
> legacy PCI devices and ifdef legacy PCI specific functions in ata
> handling.
> 

This effectively disables all default configurations which now depend
on CONFIG_LEGACY_PCI. Yet, I don't see CONFIG_LEGACY_PCI added to
configuration files which explicitly enable any of the affected
configurations. Is that on purpose ? If so, I think it should at least
be mentioned in the commit description. However, I think it would be
more appropriate to either delete all affected configuration flags from
the affected configuration files, or to add CONFIG_LEGACY_PCI=y to those
files.

Guenter
