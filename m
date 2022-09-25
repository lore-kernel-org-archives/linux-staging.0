Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA8C4403
	for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 20:28:39 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 30so6566266edw.5
        for <linux-staging@lists.linux.dev>; Sun, 25 Sep 2022 13:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JmEF3VgAAVi7+Y0Pygy9FB9gwwriHYaTSr06fWVaI4U=;
        b=bceifiwsv8+fZQAElyZEagn9YVXo4HwAkTnSEn819W3+sGGtqHDCL56F7izJ55uxce
         jfK3Fa6WPswh0xsRDyGJtnrtmArwrzbvGLaF2vEbERlxWKfMF8VVSXfzHp+VSBk3wnqT
         edzyrDy82QlJlrUDatTzDaPz5h8jJyGauiEAGdOgyZyUw4BCONCGw+5NwWWsJlpsscKc
         oR3gu9mZ2P7OPoF+je6Rhfthk/3HI9+0jJ1FMQqXOtHD9zb94QqqIkMEhZOx0MB8xvSI
         n5LKFZKgHg3eVEXy/agcwx019Np+O0+fzpadXdJSrw+TB56Rym2B7w+YRYi+PSr9e9U9
         AJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JmEF3VgAAVi7+Y0Pygy9FB9gwwriHYaTSr06fWVaI4U=;
        b=W/ZrcF+xfSPPcieigFrKsgQbQpM/0l6xwBI7sYmXpfCF22bH+az6i01gVh1gJ0lA0s
         zYb2JUS3HQIxnHSsvxcJytXje94cGVChpL66fSVHw52AUX6lhOPJfCVm1vrfL5oMauyl
         LMDs2qky02LS/tvOAIBGvq24FqnRTH0qjbZXm+NoH8nSz8ke32ESA0dvFQxmbnYWqjpM
         nFHStcfxFIbtSKxDpywhCNOwqHsOYW/8sF/L9vURHBQ6slVuQUT1I4DEFOntm9KpCZBI
         LnJbnAjlpxV8gdW0MtyxSYRn6/Hhoa9/JerIsUpfajL9HPDqVzPHbHEP+eRf8zEuTHDu
         sXRA==
X-Gm-Message-State: ACrzQf0RrYyYs2E7/RKORFfOomp5RiFBR87m+SxTkOZLzIfZfyjeas8T
	65wMJDsCPW/7jhjfgGZgsco=
X-Google-Smtp-Source: AMsMyM6rtfy7z/6lCTkdGP7UvSbT7xcpDG20JYu+B98QVQEN3IRfeNIv91caaB1bANdfarmgm4834w==
X-Received: by 2002:a05:6402:42d4:b0:443:4b8:8cba with SMTP id i20-20020a05640242d400b0044304b88cbamr19076510edc.3.1664137717571;
        Sun, 25 Sep 2022 13:28:37 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id s18-20020a1709060c1200b00780f24b797dsm7348011ejf.108.2022.09.25.13.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 13:28:37 -0700 (PDT)
Message-ID: <47fc8e27-e71f-99cb-e765-26cd3d8c26c5@gmail.com>
Date: Sun, 25 Sep 2022 22:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] staging: rtl8192e: fix CamelCase variables
Content-Language: en-US
To: Valentin Vidic <vvidic@valentin-vidic.from.hr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220925123810.2492865-1-vvidic@valentin-vidic.from.hr>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220925123810.2492865-1-vvidic@valentin-vidic.from.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/22 14:38, Valentin Vidic wrote:
> Fix checkpatch warnings for variables: LinkCtrlReg, DeviceID,
> RevisionID, IrqLine.
> 
> Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
> ---
> v2: rebase on staging-testing branch
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_pci.c | 24 ++++++++++-----------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> index 886bf4ba2adf..81e1bb856c60 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_pci.c
> @@ -16,9 +16,9 @@ static void _rtl92e_parse_pci_configuration(struct pci_dev *pdev,
>   	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
>   
>   	u8 tmp;
> -	u16 LinkCtrlReg;
> +	u16 link_ctrl_reg;
>   
> -	pcie_capability_read_word(priv->pdev, PCI_EXP_LNKCTL, &LinkCtrlReg);
> +	pcie_capability_read_word(priv->pdev, PCI_EXP_LNKCTL, &link_ctrl_reg);
>   
>   	pci_read_config_byte(pdev, 0x98, &tmp);
>   	tmp |= BIT4;
> @@ -31,28 +31,28 @@ static void _rtl92e_parse_pci_configuration(struct pci_dev *pdev,
>   bool rtl92e_check_adapter(struct pci_dev *pdev, struct net_device *dev)
>   {
>   	struct r8192_priv *priv = (struct r8192_priv *)rtllib_priv(dev);
> -	u16 DeviceID;
> -	u8  RevisionID;
> -	u16 IrqLine;
> +	u16 device_id;
> +	u8  revision_id;
> +	u16 irq_line;
>   
> -	DeviceID = pdev->device;
> -	RevisionID = pdev->revision;
> -	pci_read_config_word(pdev, 0x3C, &IrqLine);
> +	device_id = pdev->device;
> +	revision_id = pdev->revision;
> +	pci_read_config_word(pdev, 0x3C, &irq_line);
>   
>   	priv->card_8192 = priv->ops->nic_type;
>   
> -	if (DeviceID == 0x8192) {
> -		switch (RevisionID) {
> +	if (device_id == 0x8192) {
> +		switch (revision_id) {
>   		case HAL_HW_PCI_REVISION_ID_8192PCIE:
>   			dev_info(&pdev->dev,
>   				 "Adapter(8192 PCI-E) is found - DeviceID=%x\n",
> -				 DeviceID);
> +				 device_id);
>   			priv->card_8192 = NIC_8192E;
>   			break;
>   		case HAL_HW_PCI_REVISION_ID_8192SE:
>   			dev_info(&pdev->dev,
>   				 "Adapter(8192SE) is found - DeviceID=%x\n",
> -				 DeviceID);
> +				 device_id);
>   			priv->card_8192 = NIC_8192SE;
>   			break;
>   		default:

I do not like that the dev_info messages with DeviceID are not changed 
as well. But that is a formal thing.

But the patch is working:
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>




