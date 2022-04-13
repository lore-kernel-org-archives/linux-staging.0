Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141E7290C
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 16:27:31 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id g18so5012042ejc.10
        for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=dHSB2OunSV8N2CP9NqgGCpEjqZt2Tp1gm+JIRx281WY=;
        b=kVzls8+Jm+5l8AlSNCM9fh+KtEc68H/XiJChaqcD36C7J0LzgT7YgfLZrpmzHeCwti
         uGRwzF0joozPRAuIdSVCmgR8qkSaILYa+q4Nq6jNQyH6rc8sXi5KPZa02v6rtFHB3FnS
         zJYEcGjvhNHxgpERIgk62ePTbzGBLQHTsXl2viYHMBP93FfcRlP3hRX7uf2E+l7mEw12
         l7Tq1pHOnzeKiY8fgHEa10FuPwa8ugh1WfD2qs3eKOcB9qtUO39BdBXaafVSB6YKEuFG
         tRwjI8Z6Mnli8HWadcCsaHSpZ6i/tMsS6ijfKVrw94tz7keMLHByw0MGjVgYI0NVO3KR
         /+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=dHSB2OunSV8N2CP9NqgGCpEjqZt2Tp1gm+JIRx281WY=;
        b=dUEihTrG2RFrGT5rVigJR+WB9oiAmlTIRV7wm9uZzNIvbJ3l08g83SZxQ8wzbTxcZQ
         PwNGjMBgcnVwAvVwzQvQK+39t8SVX0hkYjE51eADXTB14PvXPhnitXlmWkw2MNd3s4sy
         U1oeFEFGHtHlzbieUGCIeKTO3ZFxM7y+tmGfPISLIJAfzcbBQRWJMnauLxXUZpmYo0uv
         DwflvHY7vOvDXBDax7RB2sEzCO8DOv3G20rzpZAzJcHuwyFBY+tXCnA+5Lu1Ij8F2t4K
         +F0+l75jIWR21bBBK5YQuyYZaoAwBivE/bmz5QMHAIul+nesr+h+lLVXAngVtryj9DR0
         Lmeg==
X-Gm-Message-State: AOAM530s8Q/ixh2Mwpl8FFA0QSNnu24rOCsxokL8iu+Cc68DWCahvoV9
	PxQVE/JeXRSwN7t632gDQU8=
X-Google-Smtp-Source: ABdhPJwugGCsX7h22o//7EA8siY4JDgQuOv/CXKsTbwyvqiHxO+ueNSthSfqC4XlZzhblOSnMAfArA==
X-Received: by 2002:a17:907:8a0e:b0:6e8:c5df:d9e with SMTP id sc14-20020a1709078a0e00b006e8c5df0d9emr4124725ejc.142.1649867250201;
        Wed, 13 Apr 2022 09:27:30 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b00420119333c1sm449703edj.62.2022.04.13.09.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 09:27:29 -0700 (PDT)
Message-ID: <94a72ecc-3acd-758b-15a4-a7d56bf03fbe@gmail.com>
Date: Wed, 13 Apr 2022 18:27:28 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg KH <gregkh@linuxfoundation.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 straube.linux@gmail.com
From: Michael Straube <straube.linux@gmail.com>
Subject: staging: r8188eu: struct rt_firmware_header issues
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I think the rt_firmware_hdr structure in rtw_fw.c has some issues.


struct rt_firmware_hdr {
	/*  8-byte alinment required */
	/*  LONG WORD 0 ---- */
	__le16		Signature;	/* 92C0: test chip; 92C,
					 * 88C0: test chip; 88C1: MP A-cut;
					 * 92C1: MP A-cut */
	u8		Category;	/*  AP/NIC and USB/PCI */
	u8		Function;	/*  Reserved for different FW function
					 *  indcation, for further use when
					 *  driver needs to download different
					 *  FW for different conditions */
	__le16		Version;	/*  FW Version */
	u8		Subversion;	/*  FW Subversion, default 0x00 */
	u16		Rsvd1;

	/*  LONG WORD 1 ---- */
	u8		Month;	/*  Release time Month field */
	u8		Date;	/*  Release time Date field */
	u8		Hour;	/*  Release time Hour field */
	u8		Minute;	/*  Release time Minute field */
	__le16		RamCodeSize;	/*  The size of RAM code */
	u8		Foundry;
	u8		Rsvd2;

	/*  LONG WORD 2 ---- */
	__le32		SvnIdx;	/*  The SVN entry index */
	u32		Rsvd3;

	/*  LONG WORD 3 ---- */
	u32		Rsvd4;
	u32		Rsvd5;
};


Then we have in rtl8188e_firmware_download():


	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;

	<snip>

	if (IS_FW_HEADER_EXIST(fwhdr)) {
		/*  Shift 32 bytes for FW header */
		fw_data = fw_data + 32;
		fw_size = fw_size - 32;
	}

We add/sub 32 bytes but the size of struct rt_firmware_hdr is actually
33 bytes. I noticed this when I wanted to replace:

		fw_data = fw_data + 32;
		fw_size = fw_size - 32;

with:
		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
		fw_size = fw_size - sizeof(struct rt_firmware_hdr);;

To me it looks add/sub 32 is correct here but the struct is
wrong. I don't know if the firmware for this driver is so much different
from firmware for the drivers in drivers/net/wireless/realtek/rtlwifi.
They use a struct of size 32.

Also, souldn't the u16 and u32 variables in the struct be __le16 and
__le32 ?

I wonder if we can just use the rtlwifi_firmware_header structure from
drivers/net/wireless/realtek/rtlwifi/wifi.h ?

Comments from people with better knowledge appreciated. :)

regards,
Michael


