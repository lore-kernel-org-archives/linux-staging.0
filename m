Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D7F2F23
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 21:12:10 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id e189so3398436oia.8
        for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XPkP4JXEovKBhIkTq76xChuGR44XoLAO8GaoPBQ6nDs=;
        b=i6TzqlXXoKxsPdUorCMk9xGTDjOPKY+7uxFP8nTnysDkCRjaietD00ON+PbT/asNdl
         Ku6YTDFeewegP5EEnXDd6cdzT3D1pzCOPPlRBhJEaZp9dxn4fgw7liuFoWONt9VfwxNd
         afUnjUJmTxutSp65q4lRUZEkY6MW++ZERke0fw6hQOLt/K8sWUwaSVYg0proozbIuqdE
         vDjyn5ms7Ec5TtIxrjsKtCdodGLU84023kxslabSmcYHn6p2UvA6bcliC/Xcsu13q7ca
         4Z3uRWs+Wj3oQoGMWN6JdWIBBt+5J/wf4AAZcDFR+uyNV8pDMTJDPvBKzdfXhQ3O5ABM
         /K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XPkP4JXEovKBhIkTq76xChuGR44XoLAO8GaoPBQ6nDs=;
        b=UO8lYslhLjgSeTS14ZJqKoswHyo26MjBbNEDg7u486pgpQFlD80CvhU1ZbvOQysXhZ
         +qqOTQjs4QaQ+y9+qvYpvRSjRYU7nRVp5ISX5c64A1K/yzV0ndT5mPuN90EH6nh1C3Za
         BSIAn3jvIA0+iar0dkJ8WP7SjUIzx4hMyUzk5x5DqCPdKzW+xNE9rQAjSKNFt69KRbHm
         NlRSzotLIaXfKLV8366DULkU371EudZatkI9suh3/135wk9MZV8TQ4Hnd7r4s2h471Bs
         v5YgQzLhNTnDExecE/lTXEPa4n84DzRMJ/z/EJkaWu0jHh/TVjEWUeZV/Pnh6t+PNuFy
         FCsg==
X-Gm-Message-State: AOAM532qGv0k6Cu2zblmW3xD9mqb/9SFdHTrvoxMuzWqtSX4J7fop2bf
	KvL7K5hgaUbY09oTYEzfWck=
X-Google-Smtp-Source: ABdhPJzljYBj3a1U7Y0r50ZxzdFG3dRnWSFpStT29jjX1SBQU7D/7JQkWEl2ydtWzIJDAXRSGieJQA==
X-Received: by 2002:a05:6808:138d:b0:2ef:9f4b:26fe with SMTP id c13-20020a056808138d00b002ef9f4b26femr32820oiw.124.1649884329601;
        Wed, 13 Apr 2022 14:12:09 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::100e? (2603-8090-2005-39b3-0000-0000-0000-100e.res6.spectrum.com. [2603:8090:2005:39b3::100e])
        by smtp.gmail.com with ESMTPSA id c5-20020a9d4805000000b005e6ed41066fsm68202otf.9.2022.04.13.14.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 14:12:08 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <bffc888b-5f22-6b3d-9762-2a90a33fa530@lwfinger.net>
Date: Wed, 13 Apr 2022 16:12:07 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: staging: r8188eu: struct rt_firmware_header issues
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>
Cc: Phillip Potter <phil@philpotter.co.uk>,
 Greg KH <gregkh@linuxfoundation.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <94a72ecc-3acd-758b-15a4-a7d56bf03fbe@gmail.com>
 <86a66ea4-45e3-cfa2-9130-f698ae212bfd@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <86a66ea4-45e3-cfa2-9130-f698ae212bfd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/13/22 14:42, Michael Straube wrote:
> On 4/13/22 18:27, Michael Straube wrote:
>> Hi all,
>>
>> I think the rt_firmware_hdr structure in rtw_fw.c has some issues.
>>
>>
>> struct rt_firmware_hdr {
>>      /*  8-byte alinment required */
>>      /*  LONG WORD 0 ---- */
>>      __le16        Signature;    /* 92C0: test chip; 92C,
>>                       * 88C0: test chip; 88C1: MP A-cut;
>>                       * 92C1: MP A-cut */
>>      u8        Category;    /*  AP/NIC and USB/PCI */
>>      u8        Function;    /*  Reserved for different FW function
>>                       *  indcation, for further use when
>>                       *  driver needs to download different
>>                       *  FW for different conditions */
>>      __le16        Version;    /*  FW Version */
>>      u8        Subversion;    /*  FW Subversion, default 0x00 */
>>      u16        Rsvd1;
>>
>>      /*  LONG WORD 1 ---- */
>>      u8        Month;    /*  Release time Month field */
>>      u8        Date;    /*  Release time Date field */
>>      u8        Hour;    /*  Release time Hour field */
>>      u8        Minute;    /*  Release time Minute field */
>>      __le16        RamCodeSize;    /*  The size of RAM code */
>>      u8        Foundry;
>>      u8        Rsvd2;
>>
>>      /*  LONG WORD 2 ---- */
>>      __le32        SvnIdx;    /*  The SVN entry index */
>>      u32        Rsvd3;
>>
>>      /*  LONG WORD 3 ---- */
>>      u32        Rsvd4;
>>      u32        Rsvd5;
>> };
>>
>>
>> Then we have in rtl8188e_firmware_download():
>>
>>
>>      fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
>>
>>      <snip>
>>
>>      if (IS_FW_HEADER_EXIST(fwhdr)) {
>>          /*  Shift 32 bytes for FW header */
>>          fw_data = fw_data + 32;
>>          fw_size = fw_size - 32;
>>      }
>>
>> We add/sub 32 bytes but the size of struct rt_firmware_hdr is actually
>> 33 bytes. I noticed this when I wanted to replace:
>>
>>          fw_data = fw_data + 32;
>>          fw_size = fw_size - 32;
>>
>> with:
>>          fw_data = fw_data + sizeof(struct rt_firmware_hdr);
>>          fw_size = fw_size - sizeof(struct rt_firmware_hdr);;
>>
>> To me it looks add/sub 32 is correct here but the struct is
>> wrong. I don't know if the firmware for this driver is so much different
>> from firmware for the drivers in drivers/net/wireless/realtek/rtlwifi.
>> They use a struct of size 32.
>>
>> Also, souldn't the u16 and u32 variables in the struct be __le16 and
>> __le32 ?
>>
>> I wonder if we can just use the rtlwifi_firmware_header structure from
>> drivers/net/wireless/realtek/rtlwifi/wifi.h ?
>>
>> Comments from people with better knowledge appreciated. :)
>>
>> regards,
>> Michael
>>
>>
> 
> Ok, I figured it out by looking at the hexdumps of firmware files. The
> field Rsvd1 should be u8 instead of u16. I'll prepare a patch for this.

I agree. I had prepared an analysis, but did not get it mailed before I got this 
one.

Larry

