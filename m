Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0911FA7
	for <linux-staging@lists.linux.dev>; Wed, 26 Apr 2023 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682510969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IV7e9GGOdNbALKKLab/ykBXa8Km28X43nTNspyJKM/g=;
	b=YERxLcoqrKzdqB/Yqomb+/kcbxsc5CvIyePTBb2xaZZIXiJSQemjqPFVJ1l+6UmcZGKa8G
	TGY1Uxxt6ZMPz4Q/sNkUg5XHcf9W1lESDJbsXQJpiF3c5aJIp4zJDspMpLzMGzvq6YMwYR
	Ye025ZpA44A8GFfVW+iJl+lVcM6U2pk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-RoEk4XDyMdKcjj9Sx1HJmg-1; Wed, 26 Apr 2023 08:09:03 -0400
X-MC-Unique: RoEk4XDyMdKcjj9Sx1HJmg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-94f59fc787fso661477866b.0
        for <linux-staging@lists.linux.dev>; Wed, 26 Apr 2023 05:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682510937; x=1685102937;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IV7e9GGOdNbALKKLab/ykBXa8Km28X43nTNspyJKM/g=;
        b=RI10Su9MsRX0JlAnzFQNAXEWvrT5z8Y7wJVAl8dwiAmHOZeuoCWBLEOmTuLhcIbuGL
         yfvxw9cU4UnOPb/58y4i2DWS1gG5ZdXwDQWsx+EPBnHU3kF5tOGpKIZa2/2M77qQNi3S
         H1FGQm2mYWTLozpXg3LHJntpBN+dOz2CBIg3OW+IeWvaX80pAHQ1ZKVJcstmzirN+9Kx
         nRfokmVZGggWR94vPvwc4pkhy93n0neGHOLBXQ2LFwJBkQb3NfbBtVTFSZsFEds8OZLV
         p2Eg5OejYCoQj8u7WTou9IKuH7UdOSfwUTCVWPMtokGG3gXjAdllY0g5W7K+tYwLaQV0
         WpvA==
X-Gm-Message-State: AAQBX9eyPqexZFF2CjWw/gppo5j4nsfaCSLyjGXQUiNVhPpACderSwp0
	Er6y2q9dlU1gf4saf6sVklsDnbgWMCUQ1HxfeJpQ/xSWSf6/nq/Vi0rj04A4z16Nqqc7RZUB8+u
	jlRqbMKrVbDXjLcgUxhIajGX2yQ==
X-Received: by 2002:a17:907:b60f:b0:94f:2a13:4df6 with SMTP id vl15-20020a170907b60f00b0094f2a134df6mr19835746ejc.36.1682510937219;
        Wed, 26 Apr 2023 05:08:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350YHAGgcWduH8zCy8/emaktjTBZ7NP3CGMwi4GryC57EkXZIedYMtWbyeS+LCOqgjSaTB1cJ9w==
X-Received: by 2002:a17:907:b60f:b0:94f:2a13:4df6 with SMTP id vl15-20020a170907b60f00b0094f2a134df6mr19835727ejc.36.1682510936952;
        Wed, 26 Apr 2023 05:08:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s12-20020a170906bc4c00b00947ed087a2csm8142902ejv.154.2023.04.26.05.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 05:08:56 -0700 (PDT)
Message-ID: <ae16c0b7-93a6-67b3-2a20-683d808ba636@redhat.com>
Date: Wed, 26 Apr 2023 14:08:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/5] staging: media: atomisp: sh_css_firmware: determine
 firmware version at runtime
To: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230425074841.29063-1-hpa@redhat.com>
 <20230425074841.29063-5-hpa@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230425074841.29063-5-hpa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/25/23 09:48, Kate Hsuan wrote:
> The firmware version of ISP2401 and 2400 is determined at runtime.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  .../media/atomisp/pci/sh_css_firmware.c        | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> index e7ef578db8ab..49ee88fe151d 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
> @@ -56,11 +56,8 @@ static struct firmware_header *firmware_header;
>   * which will be replaced with the actual RELEASE_VERSION
>   * during package generation. Please do not modify
>   */
> -#ifdef ISP2401
> -static const char *release_version = STR(irci_stable_candrpv_0415_20150521_0458);
> -#else
> -static const char *release_version = STR(irci_stable_candrpv_0415_20150423_1753);
> -#endif
> +static const char *release_version_2401 = STR(irci_stable_candrpv_0415_20150521_0458);
> +static const char *release_version_2400 = STR(irci_stable_candrpv_0415_20150423_1753);
>  
>  #define MAX_FW_REL_VER_NAME	300
>  static char FW_rel_ver_name[MAX_FW_REL_VER_NAME] = "---";
> @@ -191,8 +188,14 @@ sh_css_load_blob_info(const char *fw, const struct ia_css_fw_info *bi,
>  bool
>  sh_css_check_firmware_version(struct device *dev, const char *fw_data)
>  {
> +	const char *release_version;
>  	struct sh_css_fw_bi_file_h *file_header;
>  
> +	if (IS_ISP2401)
> +		release_version = release_version_2401;
> +	else
> +		release_version = release_version_2400;
> +
>  	firmware_header = (struct firmware_header *)fw_data;
>  	file_header = &firmware_header->file_header;
>  
> @@ -225,6 +228,7 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
>  		     unsigned int fw_size)
>  {
>  	unsigned int i;
> +	const char *release_version;
>  	struct ia_css_fw_info *binaries;
>  	struct sh_css_fw_bi_file_h *file_header;
>  	int ret;
> @@ -234,6 +238,10 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
>  	binaries = &firmware_header->binary_header;
>  	strscpy(FW_rel_ver_name, file_header->version,
>  		min(sizeof(FW_rel_ver_name), sizeof(file_header->version)));
> +	if (IS_ISP2401)
> +		release_version = release_version_2401;
> +	else
> +		release_version = release_version_2400;
>  	ret = sh_css_check_firmware_version(dev, fw_data);
>  	if (ret) {
>  		IA_CSS_ERROR("CSS code version (%s) and firmware version (%s) mismatch!",

