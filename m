Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C312FAE
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 14:52:31 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id b6so6956345ilv.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 07:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0270jj8hnvtU6Z8Tv4sd6F6VhusCWGFru+o41CqU4dY=;
        b=q34RR4LWBrtLkQq2xfuHk/ZCP/8aq4P6vuiGM+iRHBZZDR6Z+I4sFYKs0CjFxHbsWz
         lfkWFeVwdZ1vA1q4va4kmIwB/L5KhQ+bqHkhlE7vcgZtf67MrO4xGUKWlsF26Hbb+VPB
         LU9/uLiUg57er+zxw9lzt4pCD3EWLugba3QxYGYdoruUaQQAOdiy8ix4o4sdDWnh4a5P
         I2ond2PyOOmsht17N8CCHh0qt5ZRli4qcuVfSVAlHRDFLTPQP+OJbECtsJC1q51PLNqx
         ucvG3iLSB1RX/sm/8qt2NMu40NzhSh+RVwzHHB0CDZKpp9gY//v4ZL69CM/l0Cme+mS1
         ha7g==
X-Gm-Message-State: AOAM531w0/pj4DqHSoOtdD1oAxS2FsnrSuKle+mGdSFvWta7Jy5eAf/r
	W0GnAsgtQabOOERznZzJog==
X-Google-Smtp-Source: ABdhPJyhvUDPfLSQOfqzy/j95As8UgMQaFnCqJEywtA9Ni9W2l1qewwlfPBHZo0IFSPe2ybOjx+Azw==
X-Received: by 2002:a92:7f08:: with SMTP id a8mr4112867ild.125.1631803950945;
        Thu, 16 Sep 2021 07:52:30 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net. [96.84.70.89])
        by smtp.gmail.com with ESMTPSA id e15sm1822474ilu.29.2021.09.16.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 07:52:30 -0700 (PDT)
Received: (nullmailer pid 1340114 invoked by uid 1000);
	Thu, 16 Sep 2021 14:52:29 -0000
Date: Thu, 16 Sep 2021 09:52:29 -0500
From: Rob Herring <robh@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, git@xilinx.com, shubhrajyoti.datta@gmail.com, gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v13 1/5] dt-bindings: add documentation of xilinx
 clocking wizard
Message-ID: <YUNaLWfcTEYpGwJx@robh.at.kernel.org>
References: <cover.1631623906.git.shubhrajyoti.datta@xilinx.com>
 <5abe09974e95f127784b9eb5b8764e099e4a1b2d.1631623906.git.shubhrajyoti.datta@xilinx.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5abe09974e95f127784b9eb5b8764e099e4a1b2d.1631623906.git.shubhrajyoti.datta@xilinx.com>

On Tue, 14 Sep 2021 18:27:41 +0530, Shubhrajyoti Datta wrote:
> Add the devicetree binding for the xilinx clocking wizard.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
>  .../bindings/clock/xlnx,clocking-wizard.yaml  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
