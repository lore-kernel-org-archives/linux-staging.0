Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E41F3C1C
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 16:02:41 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4714e9f070bso641206e0c.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687708960; x=1690300960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9cIbCR/JI3IGiEKrtW27iaY9wrqECrQtHtHpkt5T9IE=;
        b=jzefFfEo88PNIA9Z2VlqncJnraG19PtjDZhYcITBgwLJKjjUAi1BzmShQ0POHrUMwA
         hdTuxTey47409eI8Yu7D/uQVaobAhabS6g86GnI9Nf1GwUOZo9Vo2Rnv7k16ZKp47s5H
         fHWvUaxV1HHagRyCZ5QO0d1LNoC5+5c/JMfoWBCOQjaUs/s9TJD6PtDTTKRBEnSI5Xy5
         PMfYqiaGRmouPDW06QctxNyCtX9+NSX6rJeBC6HK0bH4I61iOES7P5J431L0VXTOz39+
         q3Wao5iCb9+U6HoWmESlTlL51E7Dir1ok0Fie7QXz2SS2io0dF+7lFccZloX+gUPrPxi
         KCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687708960; x=1690300960;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cIbCR/JI3IGiEKrtW27iaY9wrqECrQtHtHpkt5T9IE=;
        b=eHCAZHhTXh++ZgYjPl8MpIsXpGwZNqKuqWkOl5a1S8sbLnAiD2c4AiQEXIw50Et8pt
         xy4iS7OIxcB3SB5c/CU/omqJcEJlBJTKXgHeqWqvoYyvl1ashTnuWBHm+mUeqj3kWwxF
         XUJVxAFQUdeAedKV/zo7gS/sZQOc0xZj9IWBMICm0m3EsKSt9G41xWNgpzsxe4XJZ2ZR
         ehtAJGCSFpWQ7W2LESg4i57pQW4MmFFXiJPiTKm96WFnMBLUC5+rh/YpcC95r+H/ek2W
         w2YL16AQjc52nO0OiWW/nV+Qyr6vDonq8t/VaLou84zGddKbt9UfDZioG+W5rReRYqd1
         hG7A==
X-Gm-Message-State: AC+VfDzh7ZV5KWxFqzneJedTbrtSaHbBOp68XVTqrx1AbDjOldE0gKBJ
	NfVNkTFOhWcWqqWWKTHtfrCZOo6PTeFFprhmRfxI6RLBYLpt9A==
X-Google-Smtp-Source: ACHHUZ7RvdHZvUIQzmb71QDFLCudHKYlWndu7sMUcNX0FhIwE/lK8bXB2rq2dtsaoDXtv7fjblADh6kr+EPRSLPC5pk=
X-Received: by 2002:a1f:bf92:0:b0:471:2aa6:41f6 with SMTP id
 p140-20020a1fbf92000000b004712aa641f6mr10707773vkf.2.1687708959979; Sun, 25
 Jun 2023 09:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230625155632.32403-1-franziska.naepelt@gmail.com>
In-Reply-To: <20230625155632.32403-1-franziska.naepelt@gmail.com>
From: =?UTF-8?Q?Franziska_N=C3=A4pelt?= <franziska.naepelt@googlemail.com>
Date: Sun, 25 Jun 2023 18:02:29 +0200
Message-ID: <CAAUT3iM3k3iVx7UOQ-s9OJ=aVWarAp3rEDNTzSfY-m3yJpGe4Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Fix some checkpatch issues
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, eperi1024@gmail.com, hdegoede@redhat.com, 
	quic_vjakkam@quicinc.com, johannes.berg@intel.com, tegongkang@gmail.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

Am So., 25. Juni 2023 um 17:56 Uhr schrieb Franziska Naepelt
<franziska.naepelt@googlemail.com>:
>
> This is a series of patches to fix some trivial checkpatch issues. Not all
> issues have been fixed. I intend to submit another series to fix more stuff.
>
> Testing:
>
> ---
> v3: Series to contain only remaining patches.
>
> Franziska Naepelt (3):
>   staging: rtl8723bs: Fix space issues
>   staging: rtl8723bs: Fix alignment open parenthesis
>   staging: rtl8723bs: Fix remaining blank line issue
>
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 164 +++++++++---------
>  1 file changed, 85 insertions(+), 79 deletions(-)
>
> --
> 2.39.2 (Apple Git-143)
>

Testing:
* Build the kernel with `CONFIG_RTL8723BS=m`
* Boot the kernel with busybox in initramfs
* Load the module
-> No errors or warnings
