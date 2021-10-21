Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41722C80
	for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 09:46:30 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id t184so12102689pgd.8
        for <linux-staging@lists.linux.dev>; Thu, 21 Oct 2021 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EDRM8W6FOAtvtAXHLFNxHPspkjXHpbma09BaDzDAfkk=;
        b=KgIdsoP/g2OAXrxTNMjC6ueK0rtI9wId6jmD1NLZ+ukOc6wed/9v2WdIPCOTb78aYz
         GDEI0Tx1FzIjMhNSYKC0imMjswnVYlL12x0Iq29KUXq3cHcjFVqcnMb61bBpfCO/YIvy
         J9BtJlXLY6L/4/oNs/djFOC4S13qOnFPQxQvj3KHl7Bbf+s/1xL4KlBNo0BZCiRhk8fd
         f7MqX4qX2BcqBBt+T8loS5nxfKHOkZlz3Tw8fseURIG1IlQNXEZGj1T21nnlrtuzfm3m
         Hs8POdJeffO/Ja0gLm0NXER5nZVtZy39KDVBeonuZxI8VcV4JWKAEK9tDmATfYQm4kAr
         H1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EDRM8W6FOAtvtAXHLFNxHPspkjXHpbma09BaDzDAfkk=;
        b=smiWnUk64RIiF3F637szIOPsPgpSz/v639RfDVulNh8ZBnfUPqBpOIICahWNY6vqG+
         rlegT4kyspySQM70j+NeSgYvcDAqtSLLNMxaxA7yQg3fJWt8lGsgOMw/qfaKjymsXtXZ
         9S3AzeqFK4je0ajna4QBVtWvefyW7evR/GNsHoNijJ+WA59X9Tt5G/JvvNyROE0fvZdS
         9y0KsgANNnqUfO9gWZavcJP9YnW5r8aKG3Y06OrbDN1dUkvU68XUreyMh8mPBPWvnMoX
         gVKevMPpARDLsgAJtwJSOfyFrhHX4sx7tAyKKntSD/DjS5WBpv+JC17p24JBpIIBN9k4
         YLlg==
X-Gm-Message-State: AOAM533NpplCQNw46GoI69P2UaJWberBh/9XqfnHcyqb3jevzxXLzeH3
	PLw1sFTnCsaoXSLz6bBsU7E=
X-Google-Smtp-Source: ABdhPJzP9kiHoflcziBGhE9zKMR5PHN1xmhpPriwS/SWZWPCtCppPM0AVdWw26PUjZdV/baM0YInCQ==
X-Received: by 2002:a63:b11:: with SMTP id 17mr3594840pgl.51.1634809590394;
        Thu, 21 Oct 2021 02:46:30 -0700 (PDT)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id g17sm5258410pfu.22.2021.10.21.02.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:46:29 -0700 (PDT)
Message-ID: <ace1264d7254f7159865602614d70caf7ff4b609.camel@gmail.com>
Subject: Re: [PATCH 16/17] [NOT-FOR-MERGE] media: atomsip: pci: add DMI
 match for Microsoft Surface 3 with broken DMI (OEMB)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Patrik Gfeller <patrik.gfeller@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Aniket Bhattacharyea
 <aniketmail669@gmail.com>, Aline Santana Cordeiro
 <alinesantanacordeiro@gmail.com>, Yang Yingliang
 <yangyingliang@huawei.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alan
 <alan@linux.intel.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>,
 linux-media@vger.kernel.org,  linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Thu, 21 Oct 2021 18:46:25 +0900
In-Reply-To: <71b5b886-2ca1-27a9-6776-b3bcc430e5ed@redhat.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
	 <20211017161958.44351-17-kitakar@gmail.com>
	 <71b5b886-2ca1-27a9-6776-b3bcc430e5ed@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2021-10-18 at 09:56 +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/17/21 18:19, Tsuchiya Yuto wrote:
> > This commit is added for Surface 3 with broken DMI table. HACK-ish.
> > Not intended for upstreaming. Thus, NOT-FOR-MERGE. But, if someone
> > knows a nicer way to address this, comments are welcome...
> > 
> > > 8-----------------------------------------------------------------8<
> > 
> > On some Microsoft Surface 3, the DMI table gets corrupted for unknown
> > reasons and breaks existing DMI matching used for device-specific quirks.
> > 
> > This commit adds the (broken) DMI data into dmi_system_id tables used
> > for quirks so that the driver can enable quirks even on the affected
> > systems.
> > 
> > On affected systems, the DMI data will look like this:
> > 
> >         $ grep . /sys/devices/virtual/dmi/id/{bios_vendor,board_name,board_vendor,\
> >         chassis_vendor,product_name,sys_vendor}
> >         /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
> >         /sys/devices/virtual/dmi/id/board_name:OEMB
> >         /sys/devices/virtual/dmi/id/board_vendor:OEMB
> >         /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
> >         /sys/devices/virtual/dmi/id/product_name:OEMB
> >         /sys/devices/virtual/dmi/id/sys_vendor:OEMB
> 
> I wonder what the bios_date field contains ? Typically when the DMI strings
> are no good (e.g. often they contain "Default String" or "To be filled by OEM")
> we add a check on the bios-date, which together with the broken strings is
> considered unique enough to still allow a match with broken strings in the
> kernel.

Thank you so much for the comment :-)

Here is the full output of "/sys/devices/virtual/dmi/id/*" (not showing
files that need root permission to read):

        $ grep . /sys/devices/virtual/dmi/id/*
        /sys/devices/virtual/dmi/id/bios_date:03/09/2015
        /sys/devices/virtual/dmi/id/bios_release:5.6
        /sys/devices/virtual/dmi/id/bios_vendor:American Megatrends Inc.
        /sys/devices/virtual/dmi/id/bios_version:1.51116.238
        /sys/devices/virtual/dmi/id/board_name:OEMB
        grep: /sys/devices/virtual/dmi/id/board_serial: Permission denied
        /sys/devices/virtual/dmi/id/board_vendor:OEMB
        /sys/devices/virtual/dmi/id/board_version:00
        grep: /sys/devices/virtual/dmi/id/chassis_serial: Permission denied
        /sys/devices/virtual/dmi/id/chassis_type:9
        /sys/devices/virtual/dmi/id/chassis_vendor:OEMB
        /sys/devices/virtual/dmi/id/modalias:dmi:bvnAmericanMegatrendsInc.:bvr1.51116.238:bd03/09/2015:br5.6:svnOEMB:pnOEMB:pvrB16D0SM1C4G1X1:rvnOEMB:rnOEMB:rvr00:cvnOEMB:ct9:cvr:sku:
        grep: /sys/devices/virtual/dmi/id/power: Is a directory
        /sys/devices/virtual/dmi/id/product_name:OEMB
        grep: /sys/devices/virtual/dmi/id/product_serial: Permission denied
        grep: /sys/devices/virtual/dmi/id/product_uuid: Permission denied
        /sys/devices/virtual/dmi/id/product_version:B16D0SM1C4G1X1
        grep: /sys/devices/virtual/dmi/id/subsystem: Is a directory
        /sys/devices/virtual/dmi/id/sys_vendor:OEMB
        /sys/devices/virtual/dmi/id/uevent:MODALIAS=dmi:bvnAmericanMegatrendsInc.:bvr1.51116.238:bd03/09/2015:br5.6:svnOEMB:pnOEMB:pvrB16D0SM1C4G1X1:rvnOEMB:rnOEMB:rvr00:cvnOEMB:ct9:cvr:sku:

The "bios_date" ("03/09/2015") looks not broken.

I also noticed when writing this mail, regarding the ones that need root
permission to read, "board_serial" and "chassis_serial" are now empty.
"product_serial" now shows "OEM":

        $ sudo cat /sys/devices/virtual/dmi/id/product_serial
        OEM

"product_uuid" looks not broken.

> Also have you tried doing something like "load bios/setup defaults" in
> the BIOS setup ? Maybe that helps ?

Unfortunately, there is no option like this...

Regards,
Tsuchiya Yuto

