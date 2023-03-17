Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42865A
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 06:50:49 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id fd5so16554038edb.7
        for <linux-staging@lists.linux.dev>; Thu, 16 Mar 2023 23:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679035848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZwiQZCTdL7iFDG6PfjxB0RcQIGGEmYmfV5a7taivgI=;
        b=XZkTZy3h7sZw4ZbiztlnKjDmDFjudfHbEPTnTzEHbUD4ka997k74kUHUPgDNU/vMLh
         ASPmnJpDEhfyi9u6V9ometpd1uC5BChDf6HcZ+uLRZQpikSrWHyq80Se0V1CJTubK59X
         heuBpqaYh335OL/A0nOTmeAjCvjWR1fagdjlMDSnDO3d43FnVXQGeFOaA3qbUD1CCI4X
         u1MlxocH8bhMqp3zFdF2/d2/3L/qrRODH7zUnd5B8EjaXO4S1c9TY8pjLcWXkOBthE8m
         dnLw1KKB1NIM1Bnwc0K4uS34aeRDOKoOqHX58acfwbw9S/QswV3ML5VMTv/QXXyAnKMn
         +vSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679035848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZwiQZCTdL7iFDG6PfjxB0RcQIGGEmYmfV5a7taivgI=;
        b=RYEU4ltDl9oCTxJUM/i0QCDQBQVrSOclV9B7Uh33wzx5OIpDG3rWiAeQnTvRjhIXsE
         PJ9xhYA50h8Jml5MOyZMKFMMdA/GAhwkV/8JDs2N3njArRtylFhgWbiXb4arkUazq7YT
         nlV/erGT8K/nScshlg76p+ep6FedeWBnWtmMMOKtH8aNu0vHYMAeGZApMfDlgHWv/iyE
         l4OevzP72ExVCqHM9Bgtjqqj1491ZBoXJaN6QKIj2OkAE1C5nVy4VNJ0bpHDdKIiVi4s
         vQQGl96bkGzLOZYl2JzMfSdf9vqpyzY8Q8va9JygOyOXuvHHBSYnW50S1CXnLncr4OMi
         14HQ==
X-Gm-Message-State: AO0yUKXpYQnYkYBeC/yp3SYFwaFQaYTvMkjlKexqqX3zAVMH+tbpcq2Q
	tjGl7oMvwFTeeUUrz63Howag0V5OA6E=
X-Google-Smtp-Source: AK7set+kAZThq/GfAB0rs+LLLPDquOEwRhtIl5/yKPQvzL7zPjwJZpX7pXRqhhC7AT7enGp2hzw/sw==
X-Received: by 2002:a17:907:d19:b0:930:528b:91e9 with SMTP id gn25-20020a1709070d1900b00930528b91e9mr6203439ejc.41.1679035848099;
        Thu, 16 Mar 2023 23:50:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbef.dynamic.kabel-deutschland.de. [95.90.187.239])
        by smtp.gmail.com with ESMTPSA id z24-20020a17090674d800b009289de993e2sm577438ejl.216.2023.03.16.23.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 23:50:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: vt6655: remove two unused functions
Date: Fri, 17 Mar 2023 07:50:39 +0100
Message-Id: <20230317065041.16635-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes two unused functions.

Michael Straube (2):
  staging: vt6655: remove unused bb_power_save_mode_on() function
  staging: vt6655: remove unused bb_power_save_mode_off() function

 drivers/staging/vt6655/baseband.c | 44 -------------------------------
 drivers/staging/vt6655/baseband.h |  2 --
 2 files changed, 46 deletions(-)

-- 
2.40.0

