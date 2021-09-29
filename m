Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34032FAF
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 11:29:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b192-20020a1c1bc9000000b0030cfaf18864so1479923wmb.4
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 04:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=uFr7uJ6KTmQJHmnmWVFZMG4UoPxJgzcyn7oJlR9xeQQ=;
        b=Exknt2Km+rOM24URy9Y39g26h2kaTHwcxVisGHzVDjAJ7Vf8/upcldVViHRyeMClU2
         nmdmI39qk6t5WV3WNYa+uQnRDsywFT6jzgfMqpJrH3IsbhXRlabKklsYpVto/x48KdtY
         z8ZhbDHKXaHMhm4xC/I/6BU+RnZQjrIToyfumbUE03iIKKYYdTjKS3ZOWp2Ol//fO16Q
         nizCSIhcbvPcYzhhffyPZ9QMHJiA5kdWp9bPKPGgmZb4jpvATaG3uQd56mYL9u0IikEp
         sbfUWIeAuHRBjdnA3OWNAWVbJYH/CcUthyRvsqPlhFYAEJBl44zXbmqDiI2qsmbDmEzp
         8Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=uFr7uJ6KTmQJHmnmWVFZMG4UoPxJgzcyn7oJlR9xeQQ=;
        b=rM0w7VzDYbfhYkxDdO9eark30EdvahkevumOegn15uKJyF5IELFnYQA8pUk6ngSXCC
         Z+p/qUIsroFpzngERdKbumqpi+55JXXd/0OwGz3naJRZewKPUO6Ue6DBmDl85S/T368V
         xtV1SFuMH3U7A5D2rUdGJulNYzdKgPtZcLf57UGfhUMB/HO1RzD+1PdbwyqiGUVkUEWU
         di37VgYd6X0smbcpThXLTjtHK+PdR6mXDhd18x9k2KdyJKG2bktLQ1a/6FqZs9zKLSIe
         kv2fs2M6CRISbh6SnSmP6CUv6pMPZ/SQIMxYRykB3zG8tRqYU+VAP7iJ/vNqFM4UfdrM
         jVew==
X-Gm-Message-State: AOAM530a7z+ND6UfI90c8G11hHp3V8ZyQ783VKLAPCmCSltVLmHgojIN
	0ggik8CxkMXhxAU31u0v2rg0Im9ZX8kBshuK
X-Google-Smtp-Source: ABdhPJywcrVgiD8Y+ZTWWUhoN9oSXmGDrjkJ9TwTYfQdV2oskhgQdVd4Q9KSswaIr3YzdnQO5grqqg==
X-Received: by 2002:a1c:1f10:: with SMTP id f16mr9837890wmf.179.1632914942977;
        Wed, 29 Sep 2021 04:29:02 -0700 (PDT)
Received: from ?IPv6:2a02:8084:20c7:8d80:b92e:b532:3d37:f10b? ([2a02:8084:20c7:8d80:b92e:b532:3d37:f10b])
        by smtp.gmail.com with ESMTPSA id j5sm2095159wrw.39.2021.09.29.04.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 04:29:02 -0700 (PDT)
To: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: hallblazzar <hallblazzar@gmail.com>
Subject: [PATCH v2] staging: r8188eu: Fix misspelling in comment
Message-ID: <7bc392d5-11e4-7ad0-dab6-295ccadf63b9@gmail.com>
Date: Wed, 29 Sep 2021 12:29:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

As format check raised by scripts/checkpatch.pl, comment in the rtw_ap.c
looks misspelled by accident. Help fix it.

The original error is as below shows:

CHECK: 'followign' may be misspelled - perhaps 'following'?
+Set to 0 (HT pure) under the followign conditions

Signed-off-by: Siou-Jhih, Guo <hallblazzar@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 94e02aad96b7..205168f960f6 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -744,7 +744,7 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 
 /*
 op_mode
-Set to 0 (HT pure) under the followign conditions
+Set to 0 (HT pure) under the following conditions
     - all STAs in the BSS are 20/40 MHz HT in 20/40 MHz BSS or
     - all STAs in the BSS are 20 MHz HT in 20 MHz BSS
 Set to 1 (HT non-member protection) if there may be non-HT STAs
-- 
2.25.1

