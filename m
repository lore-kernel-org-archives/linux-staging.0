Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8612563;
	Wed, 15 Mar 2023 08:27:38 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso169429pjb.3;
        Wed, 15 Mar 2023 01:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678868858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvusehUWrfc+/66ASlnNjlCPuPY5wXOImDMvoYp/fQ0=;
        b=b0+CCgmuim/LJMpI+1XEMUV+egXJuxybJv47FXV6QaM5cQ6eGSui32XGbEIXO7Fl1O
         ls2azq9pMBcSoNmho287e6ZKCLBWjFb2QAFTdAdphWSeQjDWEL5YpHa6uQysglgg0YC9
         UgCKhy1mffMMqgipSAglwGVrjfSc7xIwcrEaacXjc02GxiTFToZhRMmqY1dVp+fffmjg
         09ofhKqwk6sTzvUDfrTdjtU5CumLFYh71DmsAxMBUY0RXsxD6O5eAGAfsPps6hniPDCA
         FOIHV7863+GyCtjwZPKO5Keo/gNMIn4gfay3pHLNsR3YEeixOVW+hNy3BIZHRFVSIyNX
         3hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678868858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvusehUWrfc+/66ASlnNjlCPuPY5wXOImDMvoYp/fQ0=;
        b=4O7kE0jDywFrxr4z2IOvaTNHaiw4OL8LChhHtJwBQj8YFKTpP92hdU/AT75zp4LvNO
         JJUbCSBQ0TRK9/HEy2h01J+LpMWFmscZoZP2viYHDCrRdEKTX+2+aXPref+SiCFFBaRD
         J4baHNxMfvzY8Y8eGG63uu4J+tLkT5bAjg4sI/LtI8hj9jAsahHAnTt6SJvp5T8iLmY/
         V3lsgBsEna/XFax+mHOi4Ihj5TjfjI4Ov2KocN+sWBDfLtbqeFnMycjjWH4SIqDoWsb2
         8P1+sKqK9sGwIykNcXY0tR6j7UNH2QoSkKMe+8g+nNTtBMlkVe2bqi6uo9or/gR9lb4c
         fRPw==
X-Gm-Message-State: AO0yUKXu17KMjDb0EOMvlolxEIATTiVkHY3/W904RX5Y+LzzBTaPNMYn
	t/O3GclVXeGMjDdbeBGyd0Q=
X-Google-Smtp-Source: AK7set/s9DyM1IvIoJZp/5FCKzk1RL4bAAZfu6rRARRGJOJc8MnUCdLhy0CFwafIHI2dxVOoP6eOVQ==
X-Received: by 2002:a17:903:2311:b0:1a0:7446:ed98 with SMTP id d17-20020a170903231100b001a07446ed98mr2175603plh.47.1678868858342;
        Wed, 15 Mar 2023 01:27:38 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-41.three.co.id. [116.206.28.41])
        by smtp.gmail.com with ESMTPSA id o12-20020a1709026b0c00b0019a97f180fcsm3048943plk.37.2023.03.15.01.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 01:27:38 -0700 (PDT)
Message-ID: <32c49665-73a7-b506-172e-975d55f423ba@gmail.com>
Date: Wed, 15 Mar 2023 15:27:34 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alison Schofield <alison.schofield@intel.com>,
 Kloudifold <cloudifold.3125@gmail.com>, teddy.wang@siliconmotion.com,
 sudipm.mukherjee@gmail.com, linux-staging@lists.linux.dev,
 outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZA+K6OdPe21k8F2k@CloudiRingWorld> <ZA/+JlgWfdg2wH8B@debian.me>
 <ZBCS7DR9dZH1yds8@aschofie-mobl2>
 <5fd67671-8e21-ffa8-8571-d8b5533b4758@gmail.com> <ZBFPnZbvdI46Ah6r@kroah.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZBFPnZbvdI46Ah6r@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/15/23 11:54, Greg KH wrote:
>> I thought this style cleanup also warrants Fixes: since
>> it fixes coding style problem on existing code (see
>> Documentation/process/submitting-patches.rst).
> 
> No, sorry, Fixes: is for real bugs, not style issues.

OK, renouncing the tag.

-- 
An old man doll... just what I always wanted! - Clara

