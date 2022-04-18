Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8F57A;
	Mon, 18 Apr 2022 16:27:40 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id bg9so19725989pgb.9;
        Mon, 18 Apr 2022 09:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jg3I++lP3pbQpRoWlcxdvPAkXeaHQxo24ELrvPlKM/E=;
        b=cH2GtU4LOPOi/+XBRfxwnugAfu0MPMQBxc9Wu2WamMHh0/XU0iB5aWy/x2QibxbdMz
         jonHhv2fpMfGsFFdksSLpzTUCMwZW3YH/LkQrMxrFq6/o1NgYMv/3a4SpODk1IojLyvY
         IYHpnEVbqsTZvSEfJSCeZAJMTEcXlse58I9/w5JeWubORPPRGql+zsoMRWU7KaWJXA6r
         s9zRR7+JN8jVq2cZJfhsYYNiX0z7gs7nWbFIP3tyG5Ic9AGftrDTlerwTY6jj1rfzrVl
         cueDDFT9gAbj8d2+mXLK15eFIneY7baVO3j+ySLaQ1a+tJIHrQYJZaxyhVKGs6JqoMBr
         IbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jg3I++lP3pbQpRoWlcxdvPAkXeaHQxo24ELrvPlKM/E=;
        b=axxPNXPo1R+fRT1le+UsfSDm+I+tTnMsTmzE/P+NoZOaRPaN0QoXm83DG0WT2GPQR7
         1GSOb4BcY5QZS6IliWe51xQ6c/Z8AUddhmUVHnvp1WxBOvPlSbt9JPjLN+l0LyWMclXw
         9v17424JOr96w11OvEJ8USm5gKxbMLJOa7A816lM9mDUo+FmVjwMc/qx1YnB1L/HaoNI
         /3bAN1DD/82/LaeJqCxLFq3AUv/yoE0kujQo+99fus5C1mJ1K4NagZqCyQ9qRrZTOG8+
         RzCk9ob8gGUMmVGsqcrgJYhjvZhD/AvrLWBIxRs5Bb6FKNBc0NIYvuE6gONDLPn/OVg+
         yZeQ==
X-Gm-Message-State: AOAM533IkFD8BVyoY37kfRIuM4yvmLWvft+ds2foUwcuz57IAz6TXDU7
	vYaU04wQIfL7KZZmSHRvu5I=
X-Google-Smtp-Source: ABdhPJy/wZWcx8WwfVMjBPe1HkCVD8WdLwNDNvqg6YytGt/MvW2eDtFq6Wm1AVa01LsHpGX2s6ntKw==
X-Received: by 2002:a05:6a00:cc4:b0:505:6998:69b8 with SMTP id b4-20020a056a000cc400b00505699869b8mr13078108pfv.19.1650299259424;
        Mon, 18 Apr 2022 09:27:39 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id h18-20020a63c012000000b0039cc3c323f7sm13295602pgg.33.2022.04.18.09.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:27:39 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v2 0/3] staging: media: zoran: fix warnings reported by checkpatch
Date: Mon, 18 Apr 2022 21:52:42 +0530
Message-Id: <20220418162244.15346-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address style issues found by checkpatch in the
zoran/videocodec.c file.

changes since v1: Rework commit description and subject.

Aliya Rahmani (3):
 staging: media: zoran: use seq_puts() instead of seq_printf()
 staging: media: zoran: else is not generally useful after a break or return
 staging: media: zoran: avoid macro argument precedence issues

drivers/staging/media/zoran/videocodec.c | 9++++-----
1 file changed, 4 insertions(+), 5 deletions(-)


-- 
2.25.1

