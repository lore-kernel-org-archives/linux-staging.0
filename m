Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CBC3224
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 18:51:03 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a3c78ede4bso825361b6e.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689274262; x=1691866262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0SWbPYGf/VHa1Vrek8TS84jAYeRKRYqep/VhZf8G5PQ=;
        b=UHXnNJWWgaeZbH+Im6rfsnEO6+5CNWnj3UtXdTDq5IMfUWlHGIQj8qZm54+qB5OQbo
         og6qpu12lu6nLpbrsjuKuZDwXB1zify8A0M9xlPC35GyEN9icBdB6G60xVWkw/PZ+svR
         dZRQCgv5rI4sxAb/7uJzQxCYAXVWNUpluPGCu8wdpM/D2EU1v+JL+vOBUfNrjZRjcxet
         1rx5wTe3pgXIBQKzXBV4rGCn/DP/4g3tG18jBZRPLdW/eb70HMA6vYEVwgQEqzzXxoVt
         oI+6h5spqAdhb/yF97AgPt2Ebv62BFMLfqdwtYw3OMETn8avGHbztJpTz1v8SpFzbBQz
         MyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689274262; x=1691866262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SWbPYGf/VHa1Vrek8TS84jAYeRKRYqep/VhZf8G5PQ=;
        b=PfLDAWtgaVORjCgBq7yD4uhwY8q+eNs0RKCSQ/1/S4ucrwrhwOx3c7/NPtieCw/sYu
         YFlUbmWpEehQo+HeVNaeHHacO5E5+LQutvcXx5A6EqGEGyr/YH3QXQz88eDixF35HfbO
         I6nTnirdYj/IDXmZJ0JUDHQe/oThwowsnZrfLHIBCa8wzG6h8zu6g/x5IlTFNEHmi7Zq
         JZy/NabPIW3YdywIsnVEB/megPO0Z5JTpSpdi42ZDuu+58uX7ltJOJCWG5qp1+DJtx9q
         E9hrAPLOla3fAhVjG4cyQBCWI7otiT2r/Wx+Kwh7HQVUnQ7TnLuh6SZbZ6gweuKZNsVn
         2j8w==
X-Gm-Message-State: ABy/qLZAWn/X5S3vCH7zkFt2TJsiw4UBObSnlWlJ/+Kdf0p2ChpSCGMf
	cpo/mioLwjpbKI8F5jXSOtM=
X-Google-Smtp-Source: APBJJlGsZaZS/WeRem6l3voNBw16PU9/3Aa1djVpMcdsJe0OYN0tMH7+t5C7WMbtkERM1UJ4HOxJZQ==
X-Received: by 2002:a05:6808:f09:b0:3a1:d8bc:ff8b with SMTP id m9-20020a0568080f0900b003a1d8bcff8bmr2789761oiw.38.1689274262384;
        Thu, 13 Jul 2023 11:51:02 -0700 (PDT)
Received: from [192.168.0.202] ([216.130.59.33])
        by smtp.gmail.com with ESMTPSA id k11-20020a54440b000000b003a1ec14d8c6sm3131600oiw.23.2023.07.13.11.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 11:51:01 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <b684a76e-7d22-fece-5358-f459e4a979ff@lwfinger.net>
Date: Thu, 13 Jul 2023 13:51:00 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] staging: 7811: Fix memory leak in _r8712_init_xmit_priv
To: Your Name <namcaov@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 syzbot+cf71097ffb6755df8251@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20230712205733.29794-1-Larry.Finger@lwfinger.net>
 <ZLA1942ebuVcUT3h@nam-dell>
Content-Language: en-US
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <ZLA1942ebuVcUT3h@nam-dell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/13/23 12:35, Your Name wrote:
> The allocation was done in a loop. Shouldn't memory from previous loop iterations
> also be freed? And allocation by r8712_xmit_resource_alloc() should be freed too.

Nam,

You are right on both counts. I will prepare version 2.

Larry

