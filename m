Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3431115494
	for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 20:40:35 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-405e48d8e72so1964925e9.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Sep 2023 13:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695674434; x=1696279234; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5y1VIE90FwNznt26ixqYqeM8N12dDG5Pgiwlv6opji0=;
        b=g3EPzBc9l8xkC+LH2/6DxhEPXBBM3esLtC5vmac60h7qDlNknCB5D/NLnvPy94wiFU
         4IiUhjl9ywTc5VRBdLRP0ZQHOAx/9qOrfuTUVM2QC60qUmaFwmaGhmVxFnWacvyFaDIC
         GjOhIk/MzFk+zizv+/hNoty2Xmz5nUWND87Mnk3PA6eZ4u7NZ0mdlZunfgebVi/mLWIk
         wPKLuD1qjlqhVUkDgtdVzZbNrmER2GSWk2VPLpDiyapGNNDHqGgHs2B8ordq46RXaimx
         9llcjQPUicvZr5blzG0jm1b+9qu3WzbAelBJrfTPxL40D6ZZKT2+VGsAqWWcTpa1370B
         642g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695674434; x=1696279234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5y1VIE90FwNznt26ixqYqeM8N12dDG5Pgiwlv6opji0=;
        b=d7fBxjaRkJNu33SD64iSAI3AEaprzoH+MALA60MOQuqRpqxn9LQRkyFHzfxHUXGPV4
         OTvYto0yMbkTpcYQuQ9+HOrK7lNRKC2DXUUa82VcDLejJJEVhWHNePZ1dycskqXceB1/
         PfBNFEbQxbAsYZvufCZtPjjSLz8+0u09nAOanJNSczqDIRMhmx6bCH3NroaLwIymGblv
         FxOpoKAODmBXSdP+TgfMjcDmE6FbAG9dIaXYcJW3ssoVizp5Yhvyjnk6KwqnIGrOvA4F
         tlAGUsOcmVU82WWFF8CPc2HKbj6ERAa3F29zEelwN+BfnVf3z1vITpqsMUr7iAZ65dg3
         benw==
X-Gm-Message-State: AOJu0Yz2KU4WUgpviGzNDQ3ow8CLDjNGoXcLUMjHWKrXv21fSDllDv9A
	QL29wx5mcYcA4BSptM0AF9o=
X-Google-Smtp-Source: AGHT+IHkGoXqIJaJUGQbJmh9+m1Le6KjMm0mAk3cIDo3i5kwO5YcFRX9MZ/f7c6IJaj5l8yt0EH6VA==
X-Received: by 2002:adf:e2c8:0:b0:321:5969:d46d with SMTP id d8-20020adfe2c8000000b003215969d46dmr6082564wrj.1.1695674434182;
        Mon, 25 Sep 2023 13:40:34 -0700 (PDT)
Received: from [192.168.0.106] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4f0a000000b0031f3ad17b2csm12758354wru.52.2023.09.25.13.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 13:40:33 -0700 (PDT)
Message-ID: <50f0da35-7039-0f4f-5f58-53fd499019eb@gmail.com>
Date: Mon, 25 Sep 2023 22:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] staging: vt6655: Type encoding info dropped from variable
 "byRFType"
To: Pavan Bobba <opensource206@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZQwyRXFHA9hTLcyv@ubuntu.myguest.virtualbox.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZQwyRXFHA9hTLcyv@ubuntu.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/23 14:08, Pavan Bobba wrote:
> variable name "byRFType" updated like below:
> 
> a.type encoding info dropped from name
> b.camelcase name replaced by snakecase
> 
> Issue found by checkpatch
> 
> Signed-off-by: Pavan Bobba<opensource206@gmail.com>
> ---
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
