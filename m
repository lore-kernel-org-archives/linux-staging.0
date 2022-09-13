Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56574C85
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 18:26:08 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id v16so29466815ejr.10
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 11:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+4vcZlKpzREQFON7I3NRtdsxMCMWnGu3rOI/laNWbt4=;
        b=QciN0zfyRb35xUNzvFBSmL8EzpfWDydgM74lPVW+GnNB+LNW1PZXI9OOPwF4oN2/yr
         3CC6mXi1GyzgDbrp9hAWbuJq30Jt/paTVim+baw1xrqdAdl3++rVjIkPh7ONLEMuR7FC
         jnsGx4PtWu8iy9h4nIgGm2Gyb8L+HWSFHffndKAkgnmWD6qR+LIs+gRCEQkR18pJTLCQ
         ePHXXqj7YvWsb1XlrzbnWwWqUOTp9Cf+nQugdaxrhbCrnR98kwpbHmQvRgpwnQmTfj3e
         R3hGcPkemDdOSJMBrD90+iV5pmnEzS8dn+SjsNLov0AV2WVYlmgBTGK2Ex6dwHRm1ujU
         HpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+4vcZlKpzREQFON7I3NRtdsxMCMWnGu3rOI/laNWbt4=;
        b=1BQQeKd+qSTMk9xBRQlL/EsGHEKGJc03wYRHnHFbOXi/FgNyUD2iKfInxIIbHEPuFz
         COLcmFj7/DfJfYc4kJ82U7E6kUgWuOSmorUBIbIGwTgywDzL3ggXTY7ClNHmzdGwws+g
         nxj+Zj7Rm4CR1NIDsaand20hhQL5mX2JHAhppUYZ6bBcLga/uJdK0iEkQoKJaVO6cQcQ
         SMjzOKZnP3x5yzarnenvTMnjJn7CdVxp5oTD25sINmi2hZsrwNTJ1d671zTkysoVkhgy
         B/A0ddG+J+pO5VwmK+MUPBV+Kne9LQV7Frj2I3I5V4PNntBZiSqdO2oXQN85anVMlgRg
         qbkQ==
X-Gm-Message-State: ACgBeo3QP4zK50tTETqfP7GHZqn0bwpBE3TYsfB9ujyQSaZC3zjKUR+J
	ef9D/gRuu55Ty44HM/Y81gs=
X-Google-Smtp-Source: AA6agR6c4uaBCmP2TL5hYA26ttL59lAul9rXygyd/r7Eo++BE2qZabt6j78ixh5aykvXSod1dXbKWA==
X-Received: by 2002:a17:906:7094:b0:73d:c95a:e66e with SMTP id b20-20020a170906709400b0073dc95ae66emr22553578ejk.179.1663093566837;
        Tue, 13 Sep 2022 11:26:06 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a20:6823:7621:36e:ae26? (p200300c78f3e6a2068237621036eae26.dip0.t-ipconnect.de. [2003:c7:8f3e:6a20:6823:7621:36e:ae26])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906340200b0073cc17cdb92sm6426801ejb.106.2022.09.13.11.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 11:26:06 -0700 (PDT)
Message-ID: <9abac5a2-e070-501d-ceba-f227a081bd4b@gmail.com>
Date: Tue, 13 Sep 2022 20:26:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/12] staging: vt6655: Cleanup and rename function
 MACbSafeSoftwareReset
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1662890990.git.philipp.g.hortmann@gmail.com>
 <540a684266610f7618b3ef6000d4699d065c8e6f.1662890990.git.philipp.g.hortmann@gmail.com>
 <YyBXp9x1LnBkku2g@kadam>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <YyBXp9x1LnBkku2g@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/22 12:12, Dan Carpenter wrote:
> On Sun, Sep 11, 2022 at 12:46:04PM +0200, Philipp Hortmann wrote:
>> Rename function MACbSafeSoftwareReset to vt6655_mac_save_soft_reset and
>> abyTmpRegData to tmp_reg_data to avoid CamelCase which is not accepted by
>> checkpatch.pl. Remove return value bRetVal as it is unused by the calling
>> functions.
> Please don't mix this kind of stuff into a patch like this.
> 

In the past Greg let me know that I used to many patches for a change in 
the same lines of code and that it would be easier for him to review 
when less patches do the same.

As you wrote I am changing to many things at once. Sorry for breaking 
your automatism.

I will consider your hints for the next patches.

Thanks

Bye Philipp
