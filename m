Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7087FBF7
	for <linux-staging@lists.linux.dev>; Thu,  4 May 2023 14:50:37 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f195b164c4so4673565e9.1
        for <linux-staging@lists.linux.dev>; Thu, 04 May 2023 07:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683211836; x=1685803836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd+sHLTXbVmstXLJPhH3DtKaWv0XGS16TKOebrqIaaQ=;
        b=CVloIacv+3SpwCLqMBQg+ufqXdLkm4RBOs3F4/NSuOq6XgXTIDzb6YQX3nMyDSCAPt
         k0tuUEYbtJID3+xcBcDv+jbshPZrnm9zC0Run++DhBLBRvqgq/FS1inHbmAjxswSHaMa
         2ZScsCtNwa1lKOywVI5G3oSHuG6xsCIu5hwQi4jq+GpxiPvlRYicuGZgple1IWyIZcr4
         eMh67YzMbOPjhZCZZ4Pf6vVwEf1wYnm1svndmi71IHR5MrcCa4Hhxcow7iJkPX+zz73a
         +uoSM/7HzWU2qGXF1SnXe//4dMNPDNfdmrKLvdG30BXue9XOaFvSiySUhi0fiiDIZWW+
         Uimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683211836; x=1685803836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd+sHLTXbVmstXLJPhH3DtKaWv0XGS16TKOebrqIaaQ=;
        b=isvxkz8SODzBtHfVwClV61XYKuMAruWRanGzQ2C+QhL41cgly0WlMqPueVj7bcw7tE
         fcY6aMkVK0Sq3+wAhuBOPlXwVGXov7zOLmxdYjBWXwAiTldyZ87vfMHcDeJYYohzNMQc
         j4l0GTIAOKIX4LqX12UHQXcjLqZEBHE83fsI2p5at/mT2znNaLIBZ60Tyym/7nl5dgWU
         XIcWCKB3B8XMRbrnnv2Y8xF9UtIF68lOuyW5S9TanBJzGKm3WMun0FRGXqE/K7IulHH5
         aG7OeMg7ynYViKE4wjAfEHVtXruaIVbFohMNKSzEqwmo0ZPsGvCBF0LNmZjSCrIf/Q19
         Uz8w==
X-Gm-Message-State: AC+VfDyVgAZ0sMKb8oAclr2K4jikRdfxDVHoMdBFYWE9YnjIU4QBFTeO
	O1/kxUWzy3izbYIomLOZQniwBA==
X-Google-Smtp-Source: ACHHUZ7VcssaPT5Q5eEzKD9SDulHbDbfCyYIpenznTc3xHaeffMUUchVvHicTXTWGb8jmJs5GD1etQ==
X-Received: by 2002:a1c:4c0e:0:b0:3f1:75d0:614d with SMTP id z14-20020a1c4c0e000000b003f175d0614dmr17354195wmf.38.1683211836011;
        Thu, 04 May 2023 07:50:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x8-20020a1c7c08000000b003f24f245f57sm5066969wmc.42.2023.05.04.07.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 07:50:34 -0700 (PDT)
Date: Thu, 4 May 2023 17:50:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	florian.c.schilhabel@googlemail.com,
	Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev
Subject: Re: Redundant assignment of 'pdev_network->IELength' to itself
Message-ID: <dd9b2341-35c9-469e-b3a7-be4eaca80088@kili.mountain>
References: <CAD-N9QUCi5xesDe3L_tFTDmRk85vrKXxLpYxbn=4bkkmGAj3uQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QUCi5xesDe3L_tFTDmRk85vrKXxLpYxbn=4bkkmGAj3uQ@mail.gmail.com>

On Thu, May 04, 2023 at 09:28:44PM +0800, Dongliang Mu wrote:
> Hi maintainers,
> 
> In r8712_createbss_cmd(), there are two redundant assignments [1][2].
> 
> pdev_network->IELength = pdev_network->IELength;
> pdev_network->Ssid.SsidLength = pdev_network->Ssid.SsidLength;
> 
> However, I am not sure how to write a patch to fix this issue.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/staging/rtl8712/rtl871x_cmd.c#n333
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/staging/rtl8712/rtl871x_cmd.c#n334
> 

That comes from commit 0f11b53dbc69 ("staging:rtl8712: Fix sparse
warning incorrect type in assignment").  The commit is clearly wrong,
but you'd have to check what the proper endianness is supposed to be.

regards,
dan carpenter

