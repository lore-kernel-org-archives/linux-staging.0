Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68E820EE
	for <linux-staging@lists.linux.dev>; Tue,  7 Mar 2023 07:49:39 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id j11so29230023edq.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Mar 2023 23:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678175378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHHst01TA5pU5y6Mqx0oUARXhiVEXo6JqtZFfQAqjhw=;
        b=ONi4Dm9Wgdc5ktedVMzBP0zI8ILcdIFx9j2mwRLxW75ZJSIFMb3l8hndxHyqAgbc/y
         V4U0sW3FN8jA6K3sXloo7tZwrQ6Z5FugIdCB4NWKOW4udbOPX3sJuz1KXQdwwQf0kYnw
         nMdcgjqHIfI7tjlKZ07/vdyerL4PtI0ywcLNIxUx61yTbk861vPuFLVgsveqA43P0LFY
         eixU81tZxjzipHip9/VF6r9nZiJe07LZfLC2NdEzAVJpBGlfQbcq1HcOe995BCtZDYBx
         IajVW5m4XN1qu3PMR+6ZdQ4hBFpkn2mOq6n2LTY1NN0yhMTAijpePVPeEOYTs4xo3pH3
         sbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678175378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHHst01TA5pU5y6Mqx0oUARXhiVEXo6JqtZFfQAqjhw=;
        b=e6Uj1PehDZ0WNzTU55XFbdJH3CDjKxi8yHowVXJ+Txrng5Ti78BWfoqwTyQ4cqt7i6
         LY8IdCVmnVxMfYyjlW4zF9ylOEeX0m4TmeKwlDcF2frHxAEnR/9P4nnuUyNwV3zktbMF
         eqpn504kipvm/KyWNzy87mdOb/gBP1xfO36E10r/HvelaUbWED2z7zf/8KK1fJCM43po
         NCHv9hKK1yrCwk9DrzzvkZUIJsrFF7XijK6W2ugaXqY5W+u8l5J4qyHphsfQ/ixr1Im8
         Dh5CuMKZy0jM/hELufKNysyEONCROn53MkX6mnFkLVP57hLBV/hC7NxhAJpmdxhAK6QV
         YYWw==
X-Gm-Message-State: AO0yUKUCMBfH+2RrCdfsPplKhv0WSxdxAV2dvbixMXvmsWDjS1dx3Cao
	WcYeoFlgCbyVuSoulG2b7S4=
X-Google-Smtp-Source: AK7set86+/bGTqYW6cgMYKZruKv9bFALBAziI3VwIp8wzHrqspWFFjXtP4V9fwBm6cVa7guGlQdRZQ==
X-Received: by 2002:a17:906:edd6:b0:906:4739:d73e with SMTP id sb22-20020a170906edd600b009064739d73emr16860850ejb.2.1678175377858;
        Mon, 06 Mar 2023 23:49:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n8-20020a17090695c800b008c76facbbf7sm5762722ejy.171.2023.03.06.23.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 23:49:37 -0800 (PST)
Date: Tue, 7 Mar 2023 10:49:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8192e: Remove empty Array
 Rtl8192PciERadioC_Array
Message-ID: <52bc7f2c-50b8-4bd0-aae6-01efd8091d2c@kili.mountain>
References: <cover.1678051460.git.philipp.g.hortmann@gmail.com>
 <d8f0e8c7ee6dd820b56636db8d891012aa3ab263.1678051460.git.philipp.g.hortmann@gmail.com>
 <51b147e6-d502-461d-9c29-647ec67e0d38@kili.mountain>
 <de4266bf-a2b5-0b34-1802-7886fbd8351a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de4266bf-a2b5-0b34-1802-7886fbd8351a@gmail.com>

On Mon, Mar 06, 2023 at 09:43:50PM +0100, Philipp Hortmann wrote:
> Hi Dan,
> 
> thanks for the review. Here some answers to your questions:
> 
> With patch: "[PATCH] staging: rtl8192e: Change filename r8192E_hwimg.x to
> table.x" I changed the filename of r8192E_hwimg.c to table.c and
> r8192E_hwimg.h to table.h to adapt filenames from
> drivers/net/wireless/realtek/rtlwifi rtl8192ee and rtl8192se. Task is from
> TODO file.
> 
> The explanation from the cover letter of this patch series was:

I never read cover letters.  No one is ever going to see the cover
letter when they look through `git log -p` so I don't see the point...

> 
> Rtl8192PciERadioC_Array and Rtl8192PciERadioD_Array contain only two
> values set to 0. Reviewing the other Arrays in table.c and looking into
> other realtek drivers (rtl8192se and rtl8192ee) this arrays are not
> containing valid data.
> 
> Here some more examples of my thoughts:
> 
> A valid filled array is looking like this:
> u32 Rtl8192PciERadioA_Array[RadioA_ArrayLengthPciE] = {
> 	0x019, 0x00000003,
> 	0x000, 0x000000bf,
> 	0x001, 0x00000ee0,
> 	...
> 	over 100 lines but no 0x000, 0x00000000,
> 	...
> 	0x004, 0x00000975,
> 	0x007, 0x00000700,
> };
> 
> u32 Rtl8192PciERadioB_Array[RadioB_ArrayLengthPciE] = {
> 	0x019, 0x00000003,
> 	0x000, 0x000000bf,
> 	0x001, 0x000006e0,
> 	...
> 	over 30 lines but no 0x000, 0x00000000,
> 	...
> 	0x004, 0x00000975,
> 	0x007, 0x00000700,
> };
> 
> The empty (it is not empty but compared to the ones filled with data it is
> empty) one is looking like this:
> u32 Rtl8192PciERadioC_Array[RadioC_ArrayLengthPciE] = {
> 	0x0,  };
> 
> Looking into other cleaned up drivers from the same family:
> Example: drivers/net/wireless/realtek/rtlwifi/rtl8192se
> Arrays RadioA and RadioB are filled RadioC and RadioD do not exist.
> Example: drivers/net/wireless/realtek/rtlwifi/rtl8192ee
> Arrays RadioA and RadioB are filled RadioC and RadioD do not exist.
> Example: drivers/net/wireless/realtek/rtlwifi/rtl8192de
> Arrays RadioA and RadioB are filled RadioC and RadioD do not exist.
> 
> 
> In Example: drivers/net/wireless/realtek/rtlwifi/rtl8192cu
> I can find a RadioB Array that is just filled with one 0 which is odd:
> #define RTL8192CURADIOB_1TARRAYLENGTH	1
> 
> u32 RTL8192CU_RADIOB_1TARRAY[RTL8192CURADIOB_1TARRAYLENGTH] = {
> 	0x0,
> };
> 
> Here it is written to a variable:
> 
> 		rtlphy->hwparam_tables[RADIOB_1T].length =
> 			RTL8192CURADIOB_1TARRAYLENGTH;
> 		rtlphy->hwparam_tables[RADIOB_1T].pdata =
> 			RTL8192CU_RADIOB_1TARRAY;
> 
> Written to an another variable:
> 
> 		radiob_arraylen = rtlphy->hwparam_tables[RADIOB_1T].length;
> 		radiob_array_table = rtlphy->hwparam_tables[RADIOB_1T].pdata;
> 
> 
> And then accessed after with i + 1 the element that is random/undefined.
> 
> 
> 	case RF90_PATH_B:
> 		for (i = 0; i < radiob_arraylen; i = i + 2) {
> 			rtl_rfreg_delay(hw, rfpath, radiob_array_table[i],
> 					RFREG_OFFSET_MASK,
> 					radiob_array_table[i + 1]);

You make a really compelling argument that the code in rtl8192cu
should be deleted, but that's a different driver from what we're
discussing here.

> 		}
> 
> May be another patch.
> 
> I hope this can convince you that Arrays for RadioX that do only contain one
> or two 0 are not in use.

I can easily be convinced of that, but that's not what the commit
message says.  The commit message says the array is "empty" and that
you are deleting "dead code".  When actually you're deleting a call to
rtl92e_set_rf_reg().  So the commit message is just wrong about the
facts.

What you need to do is figure out what the call to rtl92e_set_rf_reg()
does and why it's not required.

I don't have a problem with this *patch* but the commit message says
things which are false.

regards,
dan carpenter

