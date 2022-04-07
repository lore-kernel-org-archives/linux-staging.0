Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8D163;
	Thu,  7 Apr 2022 00:09:49 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id i7so4086005oie.7;
        Wed, 06 Apr 2022 17:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IEK8wyACKyDwOMDDA6E3A9ixG1cmyZI8rYlASptfokU=;
        b=GmjX/EEEx8mtOIvA9NUHKz3CGPhXRYwt1Z4pVXu2aWdEmCcK3GPhaCfPohdyINvCoG
         KKcCWC3oB84wrGODn8+WPZTDwE41k5pDRIfr5LUuRtMqpcEbBwh/epsgN4U27ArA+ENe
         HZvt8UfzRVIDsQD6F2g0d40k1FIgzyXYlDWh73egrWo8Ci9qVmUdO0DymjBcjYLPKzC1
         fUCTvLGR9yhXtl2+xPQfyQ4hL4AER07qbO2zrzMKjbridnlvlEqgrxl6ZgDJUppcKNL0
         P3Y0NnsFnPCKlsyRCT3nABe4PAWExLIrTm04iZChnmbdJdFroB4GjTrbfeZ/KTBvIdRP
         RuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IEK8wyACKyDwOMDDA6E3A9ixG1cmyZI8rYlASptfokU=;
        b=FcdIP6qoHidD1EGIKiDEbs0XVa2yLpFFdPRQUlSBNv1Je+uea/Xf64RNNjI4KLTaGB
         CQ3HYhmzTmFSfrwdlFXCt6bx4O1HVvmTG2JHdS8tWFLSPuf6qEXDARYfd0D030n+dO3X
         gkIG8vqlppULoZ0eAkEtGbvr1m+MuobL7eB4ajkomX2d7FX+BY8kb7wGIU+ehbiwTh7k
         y3vYkAmK91Ep0dRWPa3M+5WQOVVkYr9BGxR6nOj/6kLmJaCwsK2rYancmEeaqEH9ESIr
         AUlofrejzfK8qunUG+84n+7jiBbUjjRjv3nc0MzBlh6JhOpOh1yR5lLSu874EFr3DSaB
         69jw==
X-Gm-Message-State: AOAM5301StSCpwEPYSTTgsAqy4QyO6nIQWzF0uruY3HPbVpntPrvujiU
	655AB+UlaWcJiI46mCpyLFE=
X-Google-Smtp-Source: ABdhPJzY5a75RLfA5Jfn6b3d09YWBzWfIbEu+jApvVeNqhDGhi5wuMSZ1OvHr0KsPva0GXsqQx+wXQ==
X-Received: by 2002:aca:ad11:0:b0:2f7:23cd:b156 with SMTP id w17-20020acaad11000000b002f723cdb156mr4463428oie.171.1649290188266;
        Wed, 06 Apr 2022 17:09:48 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id q13-20020a4ab3cd000000b0032830efe365sm6630582ooo.43.2022.04.06.17.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 17:09:47 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 0/2] staging: rtl8192u: use min/max macros
Date: Wed,  6 Apr 2022 19:09:42 -0500
Message-Id: <cover.1649288226.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches replace ternary and if else statements with an
equivalent min/max macro. Found with minmax coccinelle script.

---
I noticed that ieee80211.h includes linux/kernel.h and linux/jiffies.h,
which both include linux/minmax.h. Would it be a good idea to add
#include <linux/minmax.h>
in ieee80211.h in case the content of linux/kernel.h or linux/jiffies.h
changes?
---

Rebecca Mckeever (2):
  staging: rtl8192u: use max macro instead of ternary operator
  staging: rtl8192u: use min_t/max_t macros instead of if else

 drivers/staging/rtl8192u/ieee80211/ieee80211_wx.c   |  2 +-
 drivers/staging/rtl8192u/ieee80211/rtl819x_HTProc.c | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.32.0

